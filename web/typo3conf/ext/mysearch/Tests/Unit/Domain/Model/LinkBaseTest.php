<?php
namespace Porthd\Mysearch\Tests\Unit\Domain\Model;

/**
 * Test case.
 *
 * @author Dr. Dieter Porth <info@mobger.de>
 */
class LinkBaseTest extends \TYPO3\TestingFramework\Core\Unit\UnitTestCase
{
    /**
     * @var \Porthd\Mysearch\Domain\Model\LinkBase
     */
    protected $subject = null;

    protected function setUp()
    {
        parent::setUp();
        $this->subject = new \Porthd\Mysearch\Domain\Model\LinkBase();
    }

    protected function tearDown()
    {
        parent::tearDown();
    }

    /**
     * @test
     */
    public function getLinkReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getLink()
        );
    }

    /**
     * @test
     */
    public function setLinkForStringSetsLink()
    {
        $this->subject->setLink('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'link',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getLinkHashReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getLinkHash()
        );
    }

    /**
     * @test
     */
    public function setLinkHashForStringSetsLinkHash()
    {
        $this->subject->setLinkHash('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'linkHash',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getLinkScoreFactorReturnsInitialValueForFloat()
    {
        self::assertSame(
            0.0,
            $this->subject->getLinkScoreFactor()
        );
    }

    /**
     * @test
     */
    public function setLinkScoreFactorForFloatSetsLinkScoreFactor()
    {
        $this->subject->setLinkScoreFactor(3.14159265);

        self::assertAttributeEquals(
            3.14159265,
            'linkScoreFactor',
            $this->subject,
            '',
            0.000000001
        );
    }

    /**
     * @test
     */
    public function getIndexIdentReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getIndexIdent()
        );
    }

    /**
     * @test
     */
    public function setIndexIdentForStringSetsIndexIdent()
    {
        $this->subject->setIndexIdent('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'indexIdent',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getIndexScoreFactorReturnsInitialValueForFloat()
    {
        self::assertSame(
            0.0,
            $this->subject->getIndexScoreFactor()
        );
    }

    /**
     * @test
     */
    public function setIndexScoreFactorForFloatSetsIndexScoreFactor()
    {
        $this->subject->setIndexScoreFactor(3.14159265);

        self::assertAttributeEquals(
            3.14159265,
            'indexScoreFactor',
            $this->subject,
            '',
            0.000000001
        );
    }

    /**
     * @test
     */
    public function getTypeReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getType()
        );
    }

    /**
     * @test
     */
    public function setTypeForStringSetsType()
    {
        $this->subject->setType('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'type',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getGradeReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getGrade()
        );
    }

    /**
     * @test
     */
    public function setGradeForStringSetsGrade()
    {
        $this->subject->setGrade('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'grade',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getTitleReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getTitle()
        );
    }

    /**
     * @test
     */
    public function setTitleForStringSetsTitle()
    {
        $this->subject->setTitle('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'title',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getDescriptionReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getDescription()
        );
    }

    /**
     * @test
     */
    public function setDescriptionForStringSetsDescription()
    {
        $this->subject->setDescription('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'description',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getCrawlDeepReturnsInitialValueForInt()
    {
        self::assertSame(
            0,
            $this->subject->getCrawlDeep()
        );
    }

    /**
     * @test
     */
    public function setCrawlDeepForIntSetsCrawlDeep()
    {
        $this->subject->setCrawlDeep(12);

        self::assertAttributeEquals(
            12,
            'crawlDeep',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getCrawlStartLinkReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getCrawlStartLink()
        );
    }

    /**
     * @test
     */
    public function setCrawlStartLinkForStringSetsCrawlStartLink()
    {
        $this->subject->setCrawlStartLink('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'crawlStartLink',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getCrawlConnectionsReturnsInitialValueForInt()
    {
        self::assertSame(
            0,
            $this->subject->getCrawlConnections()
        );
    }

    /**
     * @test
     */
    public function setCrawlConnectionsForIntSetsCrawlConnections()
    {
        $this->subject->setCrawlConnections(12);

        self::assertAttributeEquals(
            12,
            'crawlConnections',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getLoginParamReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getLoginParam()
        );
    }

    /**
     * @test
     */
    public function setLoginParamForStringSetsLoginParam()
    {
        $this->subject->setLoginParam('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'loginParam',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getHtaccessParamReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getHtaccessParam()
        );
    }

    /**
     * @test
     */
    public function setHtaccessParamForStringSetsHtaccessParam()
    {
        $this->subject->setHtaccessParam('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'htaccessParam',
            $this->subject
        );
    }

    /**
     * @test
     */
    public function getPaymentParamReturnsInitialValueForString()
    {
        self::assertSame(
            '',
            $this->subject->getPaymentParam()
        );
    }

    /**
     * @test
     */
    public function setPaymentParamForStringSetsPaymentParam()
    {
        $this->subject->setPaymentParam('Conceived at T3CON10');

        self::assertAttributeEquals(
            'Conceived at T3CON10',
            'paymentParam',
            $this->subject
        );
    }
}
