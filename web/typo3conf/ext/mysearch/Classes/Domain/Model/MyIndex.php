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
 * Description of the aviabale Indexes
 */
class MyIndex extends \TYPO3\CMS\Extbase\DomainObject\AbstractEntity
{

    /**
     * allows the specific thematical title for the index, sorting-criteria
     *
     * @var string
     */
    protected $name = '';

    /**
     * allow diffent author for the same basic-index
     *
     * @var string
     */
    protected $vendor = '';

    /**
     * for internal use in the backend
     *
     * @var string
     */
    protected $description = '';

    /**
     * vendor_name = indexident should be unique -passthrough
     *
     * @var string
     */
    protected $indexIdent = '';

    /**
     * Is per default 1.0
     *
     * @var float
     */
    protected $indexScoreFactor = 0.0;

    /**
     * title kjey for the view in the frontend
     *
     * @var string
     */
    protected $titleTransKey = '';

    /**
     * title key for the view in the frontend
     *
     * @var string
     */
    protected $descriptionTransKey = '';

    /**
     * helpful-info for scheduler, to import datas in the linkbase-model
     *
     * @var string
     */
    protected $linkbaseFilesFolder = '';

    /**
     * helpful-info for scheduler, to import datas in the linkbase-model
     *
     * @var string
     */
    protected $defaultType = '';

    /**
     * helpful-info for scheduler, to import datas in the linkbase-model
     *
     * @var string
     */
    protected $defaultGrade = '';

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
     * Returns the name
     *
     * @return string $name
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Sets the name
     *
     * @param string $name
     * @return void
     */
    public function setName($name)
    {
        $this->name = $name;
    }

    /**
     * Returns the vendor
     *
     * @return string $vendor
     */
    public function getVendor()
    {
        return $this->vendor;
    }

    /**
     * Sets the vendor
     *
     * @param string $vendor
     * @return void
     */
    public function setVendor($vendor)
    {
        $this->vendor = $vendor;
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
     * Returns the titleTransKey
     *
     * @return string $titleTransKey
     */
    public function getTitleTransKey()
    {
        return $this->titleTransKey;
    }

    /**
     * Sets the titleTransKey
     *
     * @param string $titleTransKey
     * @return void
     */
    public function setTitleTransKey($titleTransKey)
    {
        $this->titleTransKey = $titleTransKey;
    }

    /**
     * Returns the descriptionTransKey
     *
     * @return string $descriptionTransKey
     */
    public function getDescriptionTransKey()
    {
        return $this->descriptionTransKey;
    }

    /**
     * Sets the descriptionTransKey
     *
     * @param string $descriptionTransKey
     * @return void
     */
    public function setDescriptionTransKey($descriptionTransKey)
    {
        $this->descriptionTransKey = $descriptionTransKey;
    }

    /**
     * Returns the linkbaseFilesFolder
     *
     * @return string $linkbaseFilesFolder
     */
    public function getLinkbaseFilesFolder()
    {
        return $this->linkbaseFilesFolder;
    }

    /**
     * Sets the linkbaseFilesFolder
     *
     * @param string $linkbaseFilesFolder
     * @return void
     */
    public function setLinkbaseFilesFolder($linkbaseFilesFolder)
    {
        $this->linkbaseFilesFolder = $linkbaseFilesFolder;
    }

    /**
     * Returns the defaultType
     *
     * @return string $defaultType
     */
    public function getDefaultType()
    {
        return $this->defaultType;
    }

    /**
     * Sets the defaultType
     *
     * @param string $defaultType
     * @return void
     */
    public function setDefaultType($defaultType)
    {
        $this->defaultType = $defaultType;
    }

    /**
     * Returns the defaultGrade
     *
     * @return string $defaultGrade
     */
    public function getDefaultGrade()
    {
        return $this->defaultGrade;
    }

    /**
     * Sets the defaultGrade
     *
     * @param string $defaultGrade
     * @return void
     */
    public function setDefaultGrade($defaultGrade)
    {
        $this->defaultGrade = $defaultGrade;
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
