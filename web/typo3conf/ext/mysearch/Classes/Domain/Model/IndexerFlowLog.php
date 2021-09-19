<?php

namespace Porthd\Mysearch\Domain\Model;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Porthd\Mysearch\Config\SelfConst;

class IndexerFlowLog
{
    /** @var array */
    public $orig = [];

    /** @var array */
    public $normalized = [];

    /** @var array */
    public $extended = [];

    /** @var array */
    public $reviewed = [];

    /** @var array */
    public $reduce = [];

    /** @var array */
    public $builded = [];


}

