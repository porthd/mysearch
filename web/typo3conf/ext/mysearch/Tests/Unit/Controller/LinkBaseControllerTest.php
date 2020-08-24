<?php
namespace Porthd\Mysearch\Tests\Unit\Controller;

/**
 * Test case.
 *
 * @author Dr. Dieter Porth <info@mobger.de>
 */
class LinkBaseControllerTest extends \TYPO3\TestingFramework\Core\Unit\UnitTestCase
{
    /**
     * @var \Porthd\Mysearch\Controller\LinkBaseController
     */
    protected $subject = null;

    protected function setUp()
    {
        parent::setUp();
        $this->subject = $this->getMockBuilder(\Porthd\Mysearch\Controller\LinkBaseController::class)
            ->setMethods(['redirect', 'forward', 'addFlashMessage'])
            ->disableOriginalConstructor()
            ->getMock();
    }

    protected function tearDown()
    {
        parent::tearDown();
    }

    /**
     * @test
     */
    public function listActionFetchesAllLinkBasesFromRepositoryAndAssignsThemToView()
    {

        $allLinkBases = $this->getMockBuilder(\TYPO3\CMS\Extbase\Persistence\ObjectStorage::class)
            ->disableOriginalConstructor()
            ->getMock();

        $linkBaseRepository = $this->getMockBuilder(\Porthd\Mysearch\Domain\Repository\LinkBaseRepository::class)
            ->setMethods(['findAll'])
            ->disableOriginalConstructor()
            ->getMock();
        $linkBaseRepository->expects(self::once())->method('findAll')->will(self::returnValue($allLinkBases));
        $this->inject($this->subject, 'linkBaseRepository', $linkBaseRepository);

        $view = $this->getMockBuilder(\TYPO3\CMS\Extbase\Mvc\View\ViewInterface::class)->getMock();
        $view->expects(self::once())->method('assign')->with('linkBases', $allLinkBases);
        $this->inject($this->subject, 'view', $view);

        $this->subject->listAction();
    }

    /**
     * @test
     */
    public function showActionAssignsTheGivenLinkBaseToView()
    {
        $linkBase = new \Porthd\Mysearch\Domain\Model\LinkBase();

        $view = $this->getMockBuilder(\TYPO3\CMS\Extbase\Mvc\View\ViewInterface::class)->getMock();
        $this->inject($this->subject, 'view', $view);
        $view->expects(self::once())->method('assign')->with('linkBase', $linkBase);

        $this->subject->showAction($linkBase);
    }
}
