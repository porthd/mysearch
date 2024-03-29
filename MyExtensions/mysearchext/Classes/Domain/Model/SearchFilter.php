<?php

namespace Porthd\Mysearchext\Domain\Model;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Porthd\Mysearchext\Config\SelfConst;

class SearchFilter
{


    /** @var array $indexList */
    protected $indexList = [
        SelfConst::ADDON_BASIC_INDEX_NAME,
    ];

    /** @var string $wordsForbidden */
    protected $wordsForbidden = '';

    /** @var string $wordsMain */
    protected $wordsMain = '';

    /** @var string $wordsOptional */
    protected $wordsOptional = '';

    /** @var string $wordsSecond */
    protected $wordsSecond = '';

    /** @var string $wordsStop */
    protected $wordsStop = '';

    /**
     * @param mixed $index
     */
    public function addIndexList( $index): void
    {
        $this->indexList[] = $index;
    }

    /**
     * @param mixed $index
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
     * @param string $type
     */
    public function addTypeList(string $type): void
    {
        $this->typeList[] = $type;
    }

    /**
     * @return string
     */
    public function getWordsForbidden(): string
    {
        return $this->wordsForbidden;
    }

    /**
     * @param string $wordsForbidden
     */
    public function setWordsForbidden(string $wordsForbidden): void
    {
        $this->wordsForbidden = $wordsForbidden;
    }

    /**
     * @return string
     */
    public function getWordsMain(): string
    {
        return $this->wordsMain;
    }

    /**
     * @param string $wordsMain
     */
    public function setWordsMain(string $wordsMain): void
    {
        $this->wordsMain = $wordsMain;
    }

    /**
     * @return string
     */
    public function getWordsOptional(): string
    {
        return $this->wordsOptional;
    }

    /**
     * @param string $wordsOptional
     */
    public function setWordsOptional(string $wordsOptional): void
    {
        $this->wordsOptional = $wordsOptional;
    }

    /**
     * @return string
     */
    public function getWordsSecond(): string
    {
        return $this->wordsSecond;
    }

    /**
     * @param string $wordsSecond
     */
    public function setWordsSecond(string $wordsSecond): void
    {
        $this->wordsSecond = $wordsSecond;
    }

    /**
     * @return string
     */
    public function getWordsStop(): string
    {
        return $this->wordsStop;
    }

    /**
     * @param string $wordsStop
     */
    public function setWordsStop(string $wordsStop): void
    {
        $this->wordsStop = $wordsStop;
    }


}

