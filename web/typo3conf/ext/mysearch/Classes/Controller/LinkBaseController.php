<?php
namespace Porthd\Mysearch\Controller;


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
 * LinkBaseController
 */
class LinkBaseController extends \TYPO3\CMS\Extbase\Mvc\Controller\ActionController
{

    /**
     * linkBaseRepository
     * 
     * @var \Porthd\Mysearch\Domain\Repository\LinkBaseRepository
     */
    protected $linkBaseRepository = null;

    /**
     * @param \Porthd\Mysearch\Domain\Repository\LinkBaseRepository $linkBaseRepository
     */
    public function injectLinkBaseRepository(\Porthd\Mysearch\Domain\Repository\LinkBaseRepository $linkBaseRepository)
    {
        $this->linkBaseRepository = $linkBaseRepository;
    }

    /**
     * action list
     * 
     * @return void
     */
    public function listAction()
    {
        $linkBases = $this->linkBaseRepository->findAll();
        $this->view->assign('linkBases', $linkBases);
    }

    /**
     * action show
     * 
     * @param \Porthd\Mysearch\Domain\Model\LinkBase $linkBase
     * @return void
     */
    public function showAction(\Porthd\Mysearch\Domain\Model\LinkBase $linkBase)
    {
        $this->view->assign('linkBase', $linkBase);
    }
}
