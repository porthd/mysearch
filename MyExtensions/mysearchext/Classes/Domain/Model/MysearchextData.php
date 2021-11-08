<?php

namespace Porthd\Mysearchext\Domain\Model;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Porthd\Mysearchext\Config\SelfConst;
use ReflectionClass;

class MysearchextData implements DataDocumentInterface
{


    /** @var null|DataDocumentInterface  */
    public $more = null;

    /** @var array  */
    public $orig = [];

    /** @var array  */
    public $list = [];

    /**
     * @return DataDocumentInterface|null
     */
    public function getMore(): ?DataDocumentInterface
    {
        return $this->more;
    }

    /**
     * @param DataDocumentInterface|null $more
     */
    public function setMore(?DataDocumentInterface $more): void
    {
        $this->type = $more;
    }


    /**
     * @return array
     */
    public function getOrig(): array
    {
        return $this->orig;
    }

    /**
     * @param array $orig
     */
    public function setOrig(array $orig): void
    {
        $this->orig = $orig;
    }


    public function toArray():array
    {

        $parts= [];
        $more = $this;
        do {
            $reflection_class = new ReflectionClass($more);
            $properties = $reflection_class->getProperties();
            $more = $properties[DataDocumentInterface::PROP_NAME_MORE];
            unset($properties[DataDocumentInterface::PROP_NAME_MORE]);
            $parts[] = $properties;
        } while ($more !== null);
        return array_merge(...$parts);
    }

}

