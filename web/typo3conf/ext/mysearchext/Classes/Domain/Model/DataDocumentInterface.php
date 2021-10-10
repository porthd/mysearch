<?php

namespace Porthd\Mysearchext\Domain\Model;

interface DataDocumentInterface
{

    public const PROP_NAME_MORE = 'more';

    /**
     * @return DataDocumentInterface|null
     */
    public function getMore(): ?DataDocumentInterface;

    /**
     * @param DataDocumentInterface|null $more
     */
    public function setMore(?DataDocumentInterface $more): void;


}

