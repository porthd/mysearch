<?php
namespace Porthd\Mysearch\Domain\Repository;


/***
 *
 * This file is part of the "MySearch" Extension for TYPO3 CMS.
 *
 * For the full copyright and license information, please read the
 * LICENSE.txt file that was distributed with this source code.
 *
 *  (c) 2020 Dr. Dieter Porth <info@mobger.de>, -- privat --
 *
 ***/
/**
 * The repository for LinkBases
 */
class LinkBaseRepository extends \TYPO3\CMS\Extbase\Persistence\Repository
{

    /**
     * @var array
     */
    protected $defaultOrderings = ['sorting' => \TYPO3\CMS\Extbase\Persistence\QueryInterface::ORDER_ASCENDING];
}
