<?php

namespace common\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use common\models\User;

/**
 * This is the model class for table "{{%blog}}".
 *
 * @property integer $id
 * @property string $topic
 * @property string $detail
 * @property string $tag
 * @property integer $created_by
 * @property integer $updated_by
 * @property integer $created_at
 * @property integer $updated_at
 */
class Blog extends \yii\db\ActiveRecord
{

    public function behaviors(){
        return [
            TimestampBehavior::className(),
            BlameableBehavior::className()
        ];
    }
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%blog}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['topic'],'required'],
            [['created_by', 'updated_by', 'created_at', 'updated_at'], 'integer'],
            [['topic', 'detail'], 'string', 'max' => 255],
            [['tag'], 'string', 'max' => 15]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'topic' => Yii::t('app', 'ชื่อเรื่อง'),
            'detail' => Yii::t('app', 'รายละเอียด'),
            'tag' => Yii::t('app', 'แท็ก'),
            'created_by' => Yii::t('app', 'Created By'),
            'updated_by' => Yii::t('app', 'Updated By'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }

    /**
     * @inheritdoc
     * @return BlogQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new BlogQuery(get_called_class());
    }

    public function getCreateUser(){
        return @$this->hasOne(User::className(),['id'=>'created_by']);
    }

    public function getCreatedBy(){
        return @$this->createUser->username;
    }

    public function getUpdateUser(){
        return @$this->hasOne(User::className(),['id'=>'updated_by']);
    }
    public function getUpdatedBy(){
        return @$this->updateUser->username;
    }
}
