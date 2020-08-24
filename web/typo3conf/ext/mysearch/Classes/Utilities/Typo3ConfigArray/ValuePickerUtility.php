<?php


namespace Porth\Mysearch\Utilities\Typo3ConfigArray;


use TYPO3\CMS\Core\Database\ConnectionPool;
use TYPO3\CMS\Core\Database\Query\QueryBuilder;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Extbase\Utility\LocalizationUtility;

class ValuePickerUtiliy
{
    /**
     * @param string $tableName
     * @param string $lableFiled
     * @param string $valueField
     * @param string $extensionName
     * @param bool $sortingField
     * @return array
     */
    public static function getListOfItems(
        string $tableName = '',
        string $lableField = '',
        string $valueField = '',
        string $defaultEmpty = '---',
        ?string $extensionName = null,
        bool $flagSorting = false)
    {
        if ((empty($tableName)) ||
            (empty($lableField)) ||
            (empty($valueField))
        ) {
            return [''];
        }
        /** @var QueryBuilder $queryBuilder */
        $queryBuilder = GeneralUtility::makeInstance(ConnectionPool::class)->getQueryBuilderForTable($tableName);
        $queryBuilder->getRestrictions()->removeAll();
        $queryBuilder
            ->select($lableField, $valueField)
            ->from($tableName);
        if ($flagSorting !== false) {
            $queryBuilder->orderBy('sorting');
        } else {
            $queryBuilder->orderBy($lableField);
        }
        $myResult =
            $queryBuilder->execute()
                ->fetchAll();
        $result = [];
        foreach ($myResult as $myItem) {
            $translatedLabel = LocalizationUtility::translate($myItem[$lableField], $extensionName);
            if (empty($translatedLabel)) {
                if (!empty($myItem[$lableField])) {
                    $translatedLabel = $myItem[$lableField];
                } else {
                    $translatedLabel = $defaultEmpty;
                }
            }
            $result[] = [
                $translatedLabel,
                $myItem[$valueField],
            ];
        }

        return $result;

    }
}
