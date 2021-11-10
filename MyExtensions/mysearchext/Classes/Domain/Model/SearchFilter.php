<?php

namespace Porthd\Mysearchext\Domain\Model;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Porthd\Mysearchext\Config\SelfConst;

class SearchFilter
{


    /** @var string $mainSearchWords */
    protected $mainSearchWords = '';

    /** @var string $secondSearchWords */
    protected $secondSearchWords = '';

    /** @var string $optionalSearchWords */
    protected $optionalSearchWords = '';

    /** @var string $forbiddenSearchWords */
    protected $forbiddenSearchWords = '';

    /** @var array $indexList */
    protected $indexList = [];


    /**
     * @return string
     */
    public function getMainSearchWords(): string
    {
        return $this->mainSearchWords;
    }

    /**
     * @param string $mainSearchWords
     */
    public function setMainSearchWords(string $mainSearchWords): void
    {
        $this->mainSearchWords = $mainSearchWords;
    }

    /**
     * @return string
     */
    public function getSecondSearchWords(): string
    {
        return $this->secondSearchWords;
    }

    /**
     * @param string $secondSearchWords
     */
    public function setSecondSearchWords(string $secondSearchWords): void
    {
        $this->secondSearchWords = $secondSearchWords;
    }

    /**
     * @return string
     */
    public function getOptionalSearchWords(): string
    {
        return $this->optionalSearchWords;
    }

    /**
     * @param string $optionalSearchWords
     */
    public function setOptionalSearchWords(string $optionalSearchWords): void
    {
        $this->optionalSearchWords = $optionalSearchWords;
    }

    /**
     * @return string
     */
    public function getForbiddenSearchWords(): string
    {
        return $this->forbiddenSearchWords;
    }

    /**
     * @param string $forbiddenSearchWords
     */
    public function setForbiddenSearchWords(string $forbiddenSearchWords): void
    {
        $this->forbiddenSearchWords = $forbiddenSearchWords;
    }

    /**
     * @return array
     */
    public function getIndexList(): array
    {
        return $this->indexList;
    }

    /**
     * @param array $indexList
     */
    public function setIndexList(array $indexList): void
    {
        $this->indexList = $indexList;
    }

    /**
     * @param mixed $index
     */
    public function addIndexList( $index): void
    {
        $this->indexList[] = $index;
    }


}

