<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class BlogModel extends CI_Model 
{
	
	public function categoryCreate($data)
	{
		$this->db->insert('category',$data);
	}
	public function uploadUserPhoto($data)
	{
		if($this->db->insert('image',$data))
		{
			return true;
		} 
		else 
		{
			return false;
		}

	}
	public function deleteUser($id)
	{
		$this->db->where('id', $id);
		$this->db->delete('user');

	}
	public function userList()
	{
			$this->db->select('id as userId,
								email,
								name,
								date,
								cnfrm,
								type
								');
			$query=$this->db->get('user');
			$i=0;
		foreach ($query->result() as $row)
		{
        	$data['user'][$i]['userId']=$row->userId;
        	$data['user'][$i]['email']=$row->email;
        	$data['user'][$i]['name']=$row->name;
        	$data['user'][$i]['date']=$row->date;
        	$data['user'][$i]['cnfrm']=$row->cnfrm;
        	$data['user'][$i]['type']=$row->type;
        	$i++;
        }
        $data['user']['total']=$i;
        return $data;
	}
	public function categoryList()
	{
			$this->db->select('id,
								name,
								date
								');
			$query=$this->db->get('category');
			$i=0;
		foreach ($query->result() as $row)
		{
        	$data['cat'][$i]['id']=$row->id;
        	$data['cat'][$i]['name']=$row->name;
        	$data['cat'][$i]['date']=$row->date;
        	$this->db->select('id');
        	$this->db->where('categoryId' , $row->id);
        	$query1=$this->db->get('bcategory');
        	$data['cat'][$i]['num']=$query1->num_rows();
        	$i++;
        }
        $data['cat']['total']=$i;
        return $data;
	}
	public function doConfirm($credentials)
	{
			$this->db->select('*');
			$this->db->where('email' , $credentials['email']);
			$this->db->where('rst' , $credentials['rst']);
			$query=$this->db->get('user');
			if ($query->num_rows()==1) 
			{
				foreach ($query->result() as $row)
				{
					$id=$row->id;
				}
				$this->db->set('rst', NULL);
				$this->db->set('cnfrm', "YES");
			    $this->db->where('id', $id);
			    $this->db->update('user');
				return TRUE;
			}
			else
			{
				return FALSE;
			}
	}
	public function updateView($id)
	{
		$this->db->where('id', $id);
		$this->db->set('view', 'view+1', FALSE);
		$this->db->update('bpost');
	}
	public function getComments($id)
	{
		$this->db->select('comment.id as commentId,
							user.id as userId,
							name as userName,
							comment.cnt,
							comment.date
						');
		$this->db->join('user','user.id=comment.userId','left');
		$this->db->join('bpost','bpost.id=comment.bpostId','left');
		$this->db->where('bpost.id',$id);
		$this->db->from('comment');
		$query=$this->db->get();
		$i=0;
		foreach ($query->result() as $row)
		{
        	$data['cmnt'][$i]['id']=$row->commentId;
        	$data['cmnt'][$i]['userId']=$row->userId;
        	$data['cmnt'][$i]['userName']=$row->userName;
        	$data['cmnt'][$i]['date']=$row->date;
        	$data['cmnt'][$i]['cnt']=$row->cnt;
        	$i++;
        }
        $data['cmnt']['total']=$i;
        return $data;
		
	}
	public function addComment($credentials)
	{
		$this->db->insert('comment',$credentials);
	}
	public function CreateBpost($credentials)
	{
		$this->db->insert('bpost',$credentials);
		return $this->db->insert_id();
	}
	public function viewPost($id)
	{
		$this->db->select('bpost.id as postId,
							user.id as userId,
							name as userName,
							head,
							cnt,
							bpost.date,
							view
						');
		$this->db->join('user','user.id=bpost.user','left');
		$this->db->where('bpost.id',$id);
		$this->db->from('bpost');
		$query=$this->db->get();
		foreach ($query->result() as $row)
		{
        	$data['post']['postId']=$row->postId;
        	$this->db->select('id as mediaId,
							fname,
							frmt
						');
        	$this->db->where('bpostId',$row->postId);
        	$this->db->from('mediapost');
        	$mediaQuery=$this->db->get();
        	$i=0;
        	foreach ($mediaQuery->result() as $row1)
			{
					$data['post']['fname'][$i]=$row1->fname;
					$data['post']['frmt'][$i]=$row1->frmt;
					$data['post']['mediaId'][$i]=$row1->mediaId;
					$i++;
			}
			$data['post']['count']=$i;
			$data['post']['userId']=$row->userId;
        	$data['post']['userName']=$row->userName;
        	$data['post']['head']=$row->head;
        	$data['post']['cnt']=$row->cnt;
        	$data['post']['date']=$row->date;
        	$data['post']['view']=$row->view;
		}

		return $data;
		
	}
	public function topPosts()
	{
		$this->db->select('bpost.id as postId,
							user.id as userId,
							name as userName,
							head,
							cnt,
							bpost.date,
							view
						');
		$this->db->join('user','user.id=bpost.user','left');
		$this->db->limit(3);
		$this->db->from('bpost');
    	$this->db->order_by("view", "DESC");
    	$query=$this->db->get();
    	$i=1;
    	foreach ($query->result() as $row)
		{
        	$data['popu'][$i]['postId']=$row->postId;
        	$this->db->select('id as mediaId,
							fname,
							frmt
						');
        	$this->db->where('bpostId',$row->postId);
        	$this->db->from('mediapost');
        	$this->db->limit(1);
        	$mediaQuery=$this->db->get();
        	foreach ($mediaQuery->result() as $row1)
			{
					$data['popu'][$i]['fname']=$row1->fname;
					$data['popu'][$i]['frmt']=$row1->frmt;
					$data['popu'][$i]['mediaId']=$row1->mediaId;
					
			}
        	$data['popu'][$i]['userId']=$row->userId;
        	$data['popu'][$i]['userName']=$row->userName;
        	$data['popu'][$i]['head']=$row->head;
        	$data['popu'][$i]['cnt']=$row->cnt;
        	$data['popu'][$i]['date']=$row->date;
        	$data['popu'][$i]['view']=$row->view;
        	$i++;
		}
		$data['popu']['total']=$i;
		return $data;
	}
	public function recentPosts()
	{
		$this->db->select('bpost.id as postId,
							user.id as userId,
							name as userName,
							head,
							cnt,
							bpost.date,
							view
						');
		$this->db->join('user','user.id=bpost.user','left');
		$this->db->limit(3);
		$this->db->from('bpost');
    	$this->db->order_by("bpost.date", "DESC");
    	$query=$this->db->get();
    	$i=1;
    	foreach ($query->result() as $row)
		{
        	$data['rece'][$i]['postId']=$row->postId;
        	$this->db->select('id as mediaId,
							fname,
							frmt
						');
        	$this->db->where('bpostId',$row->postId);
        	$this->db->from('mediapost');
        	$this->db->limit(1);
        	$mediaQuery=$this->db->get();
        	foreach ($mediaQuery->result() as $row1)
			{
					$data['rece'][$i]['fname']=$row1->fname;
					$data['rece'][$i]['frmt']=$row1->frmt;
					$data['rece'][$i]['mediaId']=$row1->mediaId;
					
			}
        	$data['rece'][$i]['userId']=$row->userId;
        	$data['rece'][$i]['userName']=$row->userName;
        	$data['rece'][$i]['head']=$row->head;
        	$data['rece'][$i]['cnt']=$row->cnt;
        	$data['rece'][$i]['date']=$row->date;
        	$data['rece'][$i]['view']=$row->view;
        	$i++;
		}
		$data['rece']['total']=$i;
		return $data;
	}
	public function posts($credentials)
	{
		$this->db->select('bpost.id as postId,
							user.id as userId,
							name as userName,
							head,
							cnt,
							bpost.date,
							view
						');
		$this->db->join('user','user.id=bpost.user','left');
		$this->db->limit($credentials['limit'], $credentials['start']);
		$this->db->from('bpost');
    	$this->db->order_by("date", "DESC");
    	$query=$this->db->get();
    	$i=1;
    	foreach ($query->result() as $row)
		{
        	$data['post'][$i]['postId']=$row->postId;
        	$this->db->select('id as mediaId,
							fname,
							frmt
						');
        	$this->db->where('bpostId',$row->postId);
        	$this->db->from('mediapost');
        	$this->db->limit(1);
        	$mediaQuery=$this->db->get();
        	foreach ($mediaQuery->result() as $row1)
			{
					$data['post'][$i]['fname']=$row1->fname;
					$data['post'][$i]['frmt']=$row1->frmt;
					$data['post'][$i]['mediaId']=$row1->mediaId;
					
			}
        	$data['post'][$i]['userId']=$row->userId;
        	$data['post'][$i]['userName']=$row->userName;
        	$data['post'][$i]['head']=$row->head;
        	$data['post'][$i]['cnt']=$row->cnt;
        	$data['post'][$i]['date']=$row->date;
        	$data['post'][$i]['view']=$row->view;
        	$i++;
		}
		$data['post']['total']=$i;
		return $data;
	}
	public function CreateMpost($credentials)
	{
		$this->db->insert('mediapost',$credentials);
	}
	public function isRegisterd($credentials)
	{
			$this->db->select('*');
			$this->db->where('email' , $credentials['email']);
			$query=$this->db->get('user');
			if ($query->num_rows()==1) 
			{
				return TRUE;
			}
			else
			{
				return FALSE;
			}
	}
	public function isAlreadyConfirm($credentials)
	{
			$this->db->select('cnfrm');
			$this->db->where('email' , $credentials['email']);
			$query=$this->db->get('user');
			foreach ($query->result() as $row)
			{
					$isCnfrm=$row->cnfrm;
					
			}
			if(strcmp("NO",$isCnfrm)==0)
			{
				return TRUE;
			}
			else
			{
				return FALSE;
			}
	}
	public function isEmail($email)
	{
			$this->db->select('*');
			$this->db->where('email' , $email);
			$query=$this->db->get('user');
			if ($query->num_rows()==0) 
			{
				return TRUE;
			}
			else
			{
				return FALSE;
			}
	}
	public function create($data)
	{
		$this->db->insert('user',$data);
	}
	public function uploadUserTemplate($data)
	{
		if($this->db->insert('template',$data))
		{
			return true;
		} 
		else 
		{
			return false;
		}

	}
	public function returnTemplates()
	{
			$this->db->select('id as templateId,templateName,src');
			$query=$this->db->get('template');
			return $query->result();

	}
	public function graphMonth($mon)
	{
			$this->db->select('*');
			$this->db->where('MONTH(date)' , $mon);
			$query=$this->db->get('image');
			return $query->num_rows();

	}
	public function login($credentials)
		{
			$this->db->select('email,id,name,type');
			$this->db->where('email' , $credentials['email']);
			$this->db->where('password' , $credentials['password']);
			$query=$this->db->get('user');
			if($query->num_rows()==1)
			{
				$data['result']=TRUE;
				foreach ($query->result() as $row)
				{
					$data['id']=$row->id;
					$data['name']=$row->name;
        			$data['email']=$row->email;
        			$data['type']=$row->type;
        			$this->session->set_userdata($data);
				}
			}
			else
			{
				$data['result']=FALSE;
			}
			return $data;
		}
}