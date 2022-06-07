<?php

use CodeIgniter\Pager\PagerRenderer;

/**
 * @var PagerRenderer $pager
 */
$pager->setSurroundCount(2);
?>

<nav aria-label="<?= lang('Pager.pageNavigation') ?>">
    <ul class="pagination justify-content-center mt-3">
        <li class="page-item <?= $pager->hasPreviousPage() ? '' : 'disabled'; ?>">
            <a class="page-link" href="<?= $pager->getFirst() ?>" aria-label="<?= lang('Pager.first') ?>">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <li class="page-item <?= $pager->hasPreviousPage() ? '' : 'disabled'; ?>">
            <a class="page-link" href="<?= $pager->getPreviousPage() ?>" aria-label="<?= lang('Pager.previous') ?>">
                <span aria-hidden="true">&lsaquo;</span>
            </a>
        </li>

        <?php foreach ($pager->links() as $link) : ?>
            <li class="page-item <?= $link['active'] ? 'active' : '' ?>">
                <a class="page-link" href="<?= $link['uri'] ?>">
                    <?= $link['title'] ?>
                </a>
            </li>
        <?php endforeach ?>

        <li class="page-item <?= $pager->hasNextPage() ? '' : 'disabled'; ?>">
            <a class="page-link" href="<?= $pager->getNextPage() ?>" aria-label="<?= lang('Pager.next') ?>">
                <span aria-hidden="true">&rsaquo;</span>
            </a>
        </li>
        <li class="page-item <?= $pager->hasNextPage() ? '' : 'disabled'; ?>">
            <a class="page-link" href="<?= $pager->getLast() ?>" aria-label="<?= lang('Pager.last') ?>">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>