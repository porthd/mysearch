<?php
namespace Porthd\Mysearch\Domain\Model;


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
 * LinkBase
 */
class LinkBase extends \TYPO3\CMS\Extbase\DomainObject\AbstractEntity
{

    /**
     * Webpage or absolute filepath to index in searchengine - one link for one index
     *
     * @var string
     */
    protected $link = '';

    /**
     * hash of the link
     *
     * @var string
     */
    protected $linkHash = '';

    /**
     * defaultvalue is 1
     *
     * @var float
     */
    protected $linkScoreFactor = 0.0;

    /**
     * use valuepicker - allows the selection of indexing
     *
     * @var string
     */
    protected $indexIdent = '';

    /**
     * default-value is 1
     *
     * @var float
     */
    protected $indexScoreFactor = 0.0;

    /**
     * source
     * thesis
     * overview
     * archive
     * news
     * chats
     * logs
     *
     * @var string
     */
    protected $type = '';

    /**
     * super
     * good
     * solid
     * sufficient
     * poor
     * faulty
     * bad
     *
     * @var string
     */
    protected $grade = '';

    /**
     * Title given by expert
     *
     * @var string
     */
    protected $title = '';

    /**
     * description by expert. it should contain at least all relevant keywords
     *
     * @var string
     */
    protected $description = '';

    /**
     * If you use the startpoint of bokkmarke as crawlpoints to explore more
     * informationens
     *
     * @var int
     */
    protected $crawlDeep = 0;

    /**
     * detect the nearest crawlstartlink
     *
     * @var string
     */
    protected $crawlStartLink = '';

    /**
     * count the number cof citation while you are crawling
     *
     * @var int
     */
    protected $crawlConnections = 0;

    /**
     * Some pages needs a login - not used yet
     *
     * @var string
     */
    protected $loginParam = '';

    /**
     * Some pages needs a htaccess-login - not used yet
     *
     * @var string
     */
    protected $htaccessParam = '';

    /**
     * Some pages needs a login - not used yet
     *
     * @var string
     */
    protected $paymentParam = '';

    /**
     * Returns the link
     *
     * @return string $link
     */
    public function getLink()
    {
        return $this->link;
    }

    /**
     * Sets the link
     *
     * @param string $link
     * @return void
     */
    public function setLink($link)
    {
        $this->link = $link;
    }

    /**
     * Returns the linkHash
     *
     * @return string $linkHash
     */
    public function getLinkHash()
    {
        return $this->linkHash;
    }

    /**
     * Sets the linkHash
     *
     * @param string $linkHash
     * @return void
     */
    public function setLinkHash($linkHash)
    {
        $this->linkHash = $linkHash;
    }

    /**
     * Returns the linkScoreFactor
     *
     * @return float $linkScoreFactor
     */
    public function getLinkScoreFactor()
    {
        return $this->linkScoreFactor;
    }

    /**
     * Sets the linkScoreFactor
     *
     * @param float $linkScoreFactor
     * @return void
     */
    public function setLinkScoreFactor($linkScoreFactor)
    {
        $this->linkScoreFactor = $linkScoreFactor;
    }

    /**
     * Returns the indexIdent
     *
     * @return string $indexIdent
     */
    public function getIndexIdent()
    {
        return $this->indexIdent;
    }

    /**
     * Sets the indexIdent
     *
     * @param string $indexIdent
     * @return void
     */
    public function setIndexIdent($indexIdent)
    {
        $this->indexIdent = $indexIdent;
    }

    /**
     * Returns the indexScoreFactor
     *
     * @return float $indexScoreFactor
     */
    public function getIndexScoreFactor()
    {
        return $this->indexScoreFactor;
    }

    /**
     * Sets the indexScoreFactor
     *
     * @param float $indexScoreFactor
     * @return void
     */
    public function setIndexScoreFactor($indexScoreFactor)
    {
        $this->indexScoreFactor = $indexScoreFactor;
    }

    /**
     * Returns the type
     *
     * @return string $type
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * Sets the type
     *
     * @param string $type
     * @return void
     */
    public function setType($type)
    {
        $this->type = $type;
    }

    /**
     * Returns the grade
     *
     * @return string $grade
     */
    public function getGrade()
    {
        return $this->grade;
    }

    /**
     * Sets the grade
     *
     * @param string $grade
     * @return void
     */
    public function setGrade($grade)
    {
        $this->grade = $grade;
    }

    /**
     * Returns the title
     *
     * @return string $title
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * Sets the title
     *
     * @param string $title
     * @return void
     */
    public function setTitle($title)
    {
        $this->title = $title;
    }

    /**
     * Returns the description
     *
     * @return string $description
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Sets the description
     *
     * @param string $description
     * @return void
     */
    public function setDescription($description)
    {
        $this->description = $description;
    }

    /**
     * Returns the crawlDeep
     *
     * @return int $crawlDeep
     */
    public function getCrawlDeep()
    {
        return $this->crawlDeep;
    }

    /**
     * Sets the crawlDeep
     *
     * @param int $crawlDeep
     * @return void
     */
    public function setCrawlDeep($crawlDeep)
    {
        $this->crawlDeep = $crawlDeep;
    }

    /**
     * Returns the crawlStartLink
     *
     * @return string $crawlStartLink
     */
    public function getCrawlStartLink()
    {
        return $this->crawlStartLink;
    }

    /**
     * Sets the crawlStartLink
     *
     * @param string $crawlStartLink
     * @return void
     */
    public function setCrawlStartLink($crawlStartLink)
    {
        $this->crawlStartLink = $crawlStartLink;
    }

    /**
     * Returns the crawlConnections
     *
     * @return int $crawlConnections
     */
    public function getCrawlConnections()
    {
        return $this->crawlConnections;
    }

    /**
     * Sets the crawlConnections
     *
     * @param int $crawlConnections
     * @return void
     */
    public function setCrawlConnections($crawlConnections)
    {
        $this->crawlConnections = $crawlConnections;
    }

    /**
     * Returns the loginParam
     *
     * @return string $loginParam
     */
    public function getLoginParam()
    {
        return $this->loginParam;
    }

    /**
     * Sets the loginParam
     *
     * @param string $loginParam
     * @return void
     */
    public function setLoginParam($loginParam)
    {
        $this->loginParam = $loginParam;
    }

    /**
     * Returns the htaccessParam
     *
     * @return string $htaccessParam
     */
    public function getHtaccessParam()
    {
        return $this->htaccessParam;
    }

    /**
     * Sets the htaccessParam
     *
     * @param string $htaccessParam
     * @return void
     */
    public function setHtaccessParam($htaccessParam)
    {
        $this->htaccessParam = $htaccessParam;
    }

    /**
     * Returns the paymentParam
     *
     * @return string $paymentParam
     */
    public function getPaymentParam()
    {
        return $this->paymentParam;
    }

    /**
     * Sets the paymentParam
     *
     * @param string $paymentParam
     * @return void
     */
    public function setPaymentParam($paymentParam)
    {
        $this->paymentParam = $paymentParam;
    }
}
