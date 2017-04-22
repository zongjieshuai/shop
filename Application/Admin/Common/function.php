<?php
	function uploadImage($name,$path) {
		$upload = new \Think\Upload();// 实例化上传类
	    $upload->maxSize   =     3145728 ;// 设置附件上传大小
	    $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
	    $upload->rootPath  =     './Public/Uploads/'; // 设置附件上传根目录
	    $upload->savePath  =     $path.'/'; // 设置附件上传（子）目录
	    // 上传文件 
	    $info   =   $upload->upload();
	    $path = $info[$name]['savepath'].$info[$name]['savename'];
	    if(!$info) {// 上传错误提示错误信息
	       
	        $result['status'] 		= 'error';
	        $result['error_msg'] 	= $upload->getError();
	        $result['path'] 		= '';
	    } else {
	    	$result['status'] 		= 'ok';
	        $result['error_msg'] 	= '';
	    	$result['path'] 		= $path;
	    }
	    
	    return $result;
	}