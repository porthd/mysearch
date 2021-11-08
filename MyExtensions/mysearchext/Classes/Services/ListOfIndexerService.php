<?php

namespace Porthd\Mysearchext\Services;

/***************************************************************
 *
 *  Copyright notice
 *
 *  (c) 2020 Dr. Dieter Porthd <info@mobger.de>
 *
 *  All rights reserved
 *
 *  This script is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  The GNU General Public License can be found at
 *  http://www.gnu.org/copyleft/gpl.html.
 *
 *  This copyright notice MUST APPEAR in all copies of the script!
 ***************************************************************/

use ReflectionClass;
use TYPO3\CMS\Core\SingletonInterface;
use TYPO3\CMS\Core\Utility\GeneralUtility;


class ListOfIndexerService implements SingletonInterface
{

    // Hold the class instance.
    private $list = null;
    private $active = false;


    /**
     * @return null
     */
    public function __construct()
    {
        $this->generateList();
    }


    private function generateList()
    {
        if (!is_array($this->list)) {
            $this->list = [];

            $this->active = (count($this->list) > 0);
        }
        return $this->active;
    }

    public function isActive():bool {
        return $this->active;
    }
}
