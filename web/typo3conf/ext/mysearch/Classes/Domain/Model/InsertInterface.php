<?php

namespace Porthd\Mysearch\Domain\Model;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Porthd\Mysearch\Config\SelfConst;

interface InsertInterface
{

    /**
     * @return array
     */
    public function getBody();

    /**
     * @param mixed $body
     */
    public function setBody(array $body): void;

    /**
     * @return string
     */
    public function getId(): string;

    /**
     * @param string $id
     */
    public function setId(string $id): void;

    /**
     * @return string
     */
    public function getIndex(): string;

    /**
     * @param string $index
     */
    public function setIndex(string $index): void;

    /**
     * @return string
     */
    public function getType(): string;

    /**
     * @param string $type
     */
    public function setType(string $type): void;


}

