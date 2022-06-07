<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\Categories;
use App\Models\Events;

class EventController extends BaseController
{
    public function __construct()
    {
        $this->events = new Events();
    }

    public function index()
    {
        return view('admin/events', [
            'title' => 'Daftar Event'
        ]);
    }

    // Ambil data event diterbitkan by slug
    public function event($slug)
    {
        $categories = new Categories();
        return view('pages/event', [
            'title' => 'Detail Event',
            'keyword' => '',
            'categories' => $categories->getCategories(),
            'event' => $this->events->where('published', 1)->where('slug', $slug)->first(),
            'events' => $this->events->where('published', 1)->orderBy('start_date', 'DESC')->findAll()
        ]);
    }

    // Ambil semua data event by slug
    public function find($slug)
    {
        return json_encode($this->events->where('slug', $slug)->first());
    }

    /**
     * Ambil data event untuk data table
     */
    public function listEvents()
    {
        $search = $this->request->getVar('search');
        $order = $this->request->getVar('order');
        $length = $this->request->getVar('length');
        $start = $this->request->getVar('start');
        $draw = $this->request->getVar('draw');
        return json_encode($this->events->listEvents($search, $order, $length, $start, $draw));
    }

    /**
     * Simpan event ke tabel
     */
    public function store()
    {
        // Aturan validasi input
        $rules = [
            'event' => 'required|is_unique[events.name]',
            'detail' => 'required',
            'start_date' => 'required|valid_date[Y-m-d]',
            'end_date' => 'required|valid_date[Y-m-d]',
            'image' => 'is_image[image]|ext_in[image,png,jpg,jpeg]|mime_in[image,image/png,image/jpg,image/jpeg]|max_size[image,1024]',
        ];
        $isSave = true;

        // Cek jika tidak ada id, simpan
        // jika ada id, update
        if ($this->request->getVar('id')) {
            $rules['event'] = 'required|is_unique[events.name,id,{id}]';
            $isSave = false;
        }

        if (!$this->validate($rules)) {
            return json_encode(['status' => false, 'validation' => $this->validator->getErrors()]);
        }

        $image = $this->request->getFile('image');

        if (!$this->request->getVar('id')) {
            if ($image->getError() == 4) {
                $imageEvent = 'event.jpg';
            } else {
                $imageEvent = $image->getRandomName();
                $image->move('img/event/', $imageEvent);
            }

        } else {
            if ($image->getError() == 4) {
                $imageEvent = $this->request->getVar('image_lama');
            } else {

                if ($this->request->getVar('image_lama') != 'event.jpg') {
                    unlink('img/event/' . $this->request->getVar('image_lama'));
                }

                $imageEvent = $image->getRandomName();
                $image->move('img/event/', $imageEvent);
            }
        }

        $data = [
            'id' => $this->request->getVar('id'),
            'name' => ucwords($this->request->getVar('event')),
            'slug' => strtolower(str_replace(' ', '-', $this->request->getVar('event'))),
            'detail' => $this->request->getVar('detail'),
            'image' => $imageEvent,
            'published' => $this->request->getVar('publish') ?? 0,
            'start_date' => $this->request->getVar('start_date'),
            'end_date' => $this->request->getVar('end_date'),
        ];

        $this->events->save($data);
        return json_encode(['status' => true, 'isSave' => $isSave]);
    }

    // Hapus event
    public function delete($id)
    {
        $event = $this->events->find($id);
        // hapus data
        if ($this->events->delete($id)) {
            // Hapus foto event jika tidak default
            if ($event['image'] != 'event.jpg') {
                unlink('img/event/' . $event['image']);
            }
            return json_encode(true);
        }
    }

    // Publish event
    public function publish()
    {
        $this->events->update($this->request->getVar('id'), ['published' => 1]);
        return json_encode(true);
    }
}
