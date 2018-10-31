<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
  class BlogController extends CI_Controller 
{
	public function isLoggedIn()
	{
		if($this->session->userdata('email') && $this->session->userdata('name') && $this->session->userdata('id') && $this->session->userdata('type'))
		{
			$data['name']=$this->session->userdata('name');
			$data['email']=$this->session->userdata('email');
			$this->load->view('partials/header',$data);
			return TRUE;
		}
		else
		{
			return FALSE;
		}
		
		
	}public function isLoggedInWithout()
	{
		if($this->session->userdata('email') && $this->session->userdata('name') && $this->session->userdata('id') && $this->session->userdata('type'))
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		}
		
		
	}
	public function isLoggedInPost()
	{
		if($this->session->userdata('email') && $this->session->userdata('name') && $this->session->userdata('id') && $this->session->userdata('type')=='post')
		{
			$data['name']=$this->session->userdata('name');
			$data['email']=$this->session->userdata('email');
			$this->load->view('partials/postHeader',$data);
			return TRUE;
		}
		else
		{
			return FALSE;
		}
		
		
	}
	public function isLoggedInCmnt()
	{
		if($this->session->userdata('email') && $this->session->userdata('name') && $this->session->userdata('id') && $this->session->userdata('type')=='cmnt')
		{
			$data['name']=$this->session->userdata('name');
			$data['email']=$this->session->userdata('email');
			$this->load->view('partials/cmntHeader',$data);
			return TRUE;
		}
		else
		{
			return FALSE;
		}
		
		
	}
	public function displayPost()
	{
		if ($this->input->post())
	    {
	    	$credentials['date'] = date('Y-m-d H:i:s');
	    	$credentials['userId']=$this->input->post('userId');
	    	$credentials['bpostId']=$this->input->post('postId');
	    	$credentials['cnt']=$this->input->post('comment');
	    	if(!empty($credentials['cnt']))
	    	{
	    		
	    		$this->BlogModel->addComment($credentials);
	    	}
	    }
		$id=$this->uri->segment(2);
		$this->BlogModel->updateView($id);
		$data3=$this->BlogModel->getComments($id);
		$data=$this->BlogModel->viewPost($id);
		$data1=$this->BlogModel->topPosts();
		$data2=$this->BlogModel->recentPosts();
		$this->load->helper(array('url'));
        $data['url']=$this->config->base_url();
		if($this->isLoggedInWithout())
		{
			$data4['user']['id']=$this->session->userdata('id');
			$data4['user']['name']=$this->session->userdata('name');
			$data4['user']['email']=$this->session->userdata('email');
			$data=$data+$data1+$data2+$data4+$data3;
		}
		else
		{
			$data=$data+$data1+$data2+$data3;
		}
		if($data['post']['count']==0)
		{
			$this->load->view('n_cnt',$data);
		}
		else if ($data['post']['count']==1) 
		{
			if(strcmp($data['post']['frmt'][0],"image/jpeg")==0)
			{
				$this->load->view('img_cnt',$data);
			}
			else if (strcmp($data['post']['frmt'][0],"video/jpeg")==0) 
			{
				$this->load->view('vid_cnt',$data);
			}
			else
			{
				var_dump("HAi1");
			}
		}
		else
		{
			if(strcmp($data['post']['frmt'][0],"image/jpeg")==0)
			{
				$this->load->view('m_img_cnt',$data);
			}
			else if (strcmp($data['post']['frmt'][0],"video/jpeg")==0) 
			{
				$this->load->view('m_vid_cnt',$data);
			}
			else
			{
				var_dump("HAi");
			}
		}
	}

	public function isLoggedInAdmin()
	{
		if($this->session->userdata('email') && $this->session->userdata('name') && $this->session->userdata('id') && $this->session->userdata('type')=='admin')
		{
			$data['name']=$this->session->userdata('name');
			$data['email']=$this->session->userdata('email');
			$this->load->view('partials/adminHeader',$data);
			return TRUE;
		}
		else
		{
			return FALSE;
		}
		
		
	}
	public function isLoggedInAdminWithout()
	{
		if($this->session->userdata('email') && $this->session->userdata('name') && $this->session->userdata('id') && $this->session->userdata('type')=='admin')
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		}
		
		
	}
	public function doLogout()
	{
		$this->session->unset_userdata('email');
		$this->session->unset_userdata('type');
		$this->session->unset_userdata('id');
		$this->session->unset_userdata('name');
		redirect('user/login');
	}

	public function home()
	{
		$data['prev']=1;
		$data['next']=2;
		$data['start']=0;
		$data['limit']=10;
		$data1=$this->BlogModel->posts($data);
		$data2=$this->BlogModel->topPosts();
		$data3=$this->BlogModel->recentPosts();
		$this->load->helper(array('url'));
        $data['url']=$this->config->base_url();
        $data=$data+$data1+$data2+$data3;
		$this->load->view('home',$data);
		
	}
	
	public function confirmAccount()
	{
		$credentials['email']=$this->uri->segment(3);
		$credentials['rst']=$this->uri->segment(4);
		if($this->BlogModel->isRegisterd($credentials))
		{
			if($this->BlogModel->isAlreadyConfirm($credentials))
			{
				if($this->BlogModel->doConfirm($credentials))
				{
					$data['message']="You Are Successfully Confirmed Your Account.Please  Login to Continue.";
			    	$this->load->view('user/login',$data);
				}
				else
				{
					$data['message']="You Are Given an Invalid Confirmation Email.";
			    	$this->load->view('user/login',$data);
				}
			}
			else
			{
				$data['message']="You Are Already Confirmed Your Email Please Login.";
		    	$this->load->view('user/login',$data);
			}
		}
		else
		{
			$data['message']="You Are Not Registered Please Create Your Account.";
		    $this->load->view('user/login',$data);
		}
		

	}
	public function cnfrmEmailSend($credentials)
	{
			$toEmail=$credentials['email'];
			$message1=$credentials['rst'];
			$message3="Hi,".$credentials['name'].".";
			$message2="Your Can Confirm Your Account By Clicking The Link : http://localhost:8081/Blog/index.php/user/confirm";
			$message=$message3.$message2."/".$toEmail."/".$message1;
 			$this->load->library('email');
			$config['protocol'] = 'smtp';
            $config['smtp_host'] = 'ssl://smtp.googlemail.com';
            $config['smtp_port'] = '465';
            $config['smtp_user'] = 'elixiroflyf123@gmail.com';
            $config['smtp_pass'] = "abhishek123";
            $config['mailtype'] = 'html';
            $config['charset'] = 'utf-8';
            $config['wordwrap'] = TRUE;
            $config['newline'] = "\r\n"; 
            $this->email->initialize($config);  
			$this->email->from('elixiroflyf123@gmail.com', 'MBCET CSE BLOG');
			$this->email->to($toEmail);
			$this->email->cc('');
			$this->email->bcc('');
			$this->email->subject('Confirm');
			$this->email->message($message);
			if($this->email->send()){
				$data['message']="Email sent successfully";
			}else{
				echo $this->email->print_debugger();die;
				$data['message']="Failed to sent email";

			}

		
		
	}
	public function CreateUser()
  	{
	    if ($this->input->post())
	    {
	    		 $data['name'] = $this->input->post('name');
	    		 $data['email'] = $this->input->post('email');
	    		 $data['password'] = $this->input->post('password');
	    		 $data1 = $this->input->post('cnfrm_password');
	    		 if(!$this->BlogModel->isEmail($data['email']))
	    		 {
	    		 	$data['message']="You Have Already Registered.But Should Confirm Your Email";
	    		 	$this->load->view('user/login',$data);
	    		 }
	    		 elseif(strcmp($data1,$data['password'])!=0)
	    		 {
	    		 		$data['message']="Invalid Login Credentials Entered";

						$this->load->view('user/login',$data);
	    		 }
	    		 else
	    		 {
					$data['rst']=random_string('alnum',5);
					$data['date'] = date('Y-m-d H:i:s');
	    		 	$this->BlogModel->create($data);
	    		 	$credentials['name']=$data['name'];
	    		 	$credentials['email']=$data['email'];

	    		 	$credentials['rst']=$data['rst'];
	    		 	$this->cnfrmEmailSend($credentials);
	    		 	$data['message']="Confirmation Email Has Been Sent to Your Email";
	    		 	$this->load->view('user/login',$data);
	    		 }
	    		 
	    }
	    else
	    {
	    		redirect('user/login');
	    }
	}
	public function showUserList()
	{
		if($this->isLoggedInAdmin())
		{
			$data=$this->BlogModel->userList();
			$this->load->view('user/userList',$data);
		}
		else
		{
			redirect('user/dashboard');
		}
		
		
	}
	public function dashboardUser()
	{

		if($this->isLoggedInAdmin())
		{
			$this->load->view('user/adminDashboard');
		}
		else if($this->isLoggedInPost())
		{
			$this->load->view('user/postDashboard');
		}
		else if($this->isLoggedInCmnt())
		{
			$this->load->view('user/cmntDashboard');
		}
		else
		{
			redirect('user/login');
		}
		
		
	}
	public function contact()
	{
		$this->load->view('contact');
	}
	public function createPost()
	{
		if($this->isLoggedInPost() || $this->isLoggedInAdmin())
		{
			if($this->input->post())
			{
				$data['head'] = $this->input->post('heads');
				$data['cnt'] = $this->input->post('cnt');
				$count=$this->input->post('count');
				$data1['count']=$count;
				$data['user']=$this->session->userdata('id');
				$data['date']=(date('Y-m-d H:i:s'));
				$data2['bpostId']=$this->BlogModel->CreateBpost($data);
				for($i = 0; $i < $count; $i++)
				{	
					 $_FILES['file']['name']     = $_FILES['user-image']['name'][$i];
	                $_FILES['file']['type']     = $_FILES['user-image']['type'][$i];
	                $_FILES['file']['tmp_name'] = $_FILES['user-image']['tmp_name'][$i];
	                $_FILES['file']['error']     = $_FILES['user-image']['error'][$i];
	                $_FILES['file']['size']     = $_FILES['user-image']['size'][$i];
					$config['upload_path'] = './assets/upload_media/';
					
					$config['allowed_types'] = 'gif|jpg|png';
					$config['max_size']	= '10000';
					$config['max_width']  = '2224';
					$config['max_height']  = '2224';
					$data2['date']=(date('Y-m-d H:i:s'));
					
					$this->load->library('upload', $config);
					if ( ! $this->upload->do_upload('file'))
					{
						$data['error'] = $this->upload->display_errors();
						var_dump($data['error']);
						die;
						

					}
					else
					{
						$upload_data =  $this->upload->data();
						$data2['fname']= $upload_data['file_name'];
						$data2['frmt']= $upload_data['file_type'];
						$this->BlogModel->CreateMpost($data2);
					}
				}
				redirect('user/dashboard');
			}
			else
			{
				$this->load->view('user/createPost');
			}
		}
		else
		{
			redirect('user/login');
		}
		
		
	}
	public function changeRole()
	{
		if ($this->input->post() && $this->input->is_ajax_request()) 
	    {
	      $credentials['type'] = $this->input->post('value');
	      $credentials['type'] = $this->input->post('userId');
	      var_dump($credentials);
	      die;
	      $this->BlogModel->changeRole($credentials);
	      echo json_encode(TRUE);
	    } 
	    else 
	    {
	      redirect('user/user-list');
	    }
	}
	public function categoryList()
	{
		if($this->isLoggedInAdmin())
		{
			$data=$this->BlogModel->categoryList();
			$this->load->view('user/categoryList',$data);
		}
		else
		{
			redirect('user/dashboard');
		}
	}
	public function categoryCreate()
	{
		if($this->isLoggedInAdmin())
		{

			if ($this->input->post())
			{
				$credentials['name'] = $this->input->post('name');
				$credentials['date'] = date('Y-m-d H:i:s');
				$this->BlogModel->categoryCreate($credentials);
				redirect('user/category-list');
			}
			else
			{
				$this->load->view('user/createCategory');
			}
			
		}
		else
		{
			redirect('user/dashboard');
		}
	}
	public function deleteUser()
	{
		if($this->isLoggedInAdminWithout())
		{

			$id=$this->uri->segment(3);
			$this->BlogModel->deleteUser($id);
			redirect('user/user-list');
		}
		else
		{
			redirect('user/dashboard');
		}
	}
	public function login()
	{
		if($this->isLoggedIn())
		{
			redirect('user/dashboard');
		}
		else
		{
			if($this->input->post())
			{
				$email = $this->input->post('email');
				$password = $this->input->post('password');
				$credentials['email']=$email;
				$credentials['password']=$password;
				$this->form_validation->set_rules('email', 'Email', 'required|max_length[100]|trim|valid_email');
				$this->form_validation->set_rules('password', 'Password', 'required|max_length[30]');
				if ($this->form_validation->run() == FALSE) 
				{
					$data['message']="Entered Username/Email is in invalid format.";
					$this->load->view('user/login',$data);
				}
				else
				{
					if(!$this->BlogModel->isEmail($email))
					{
						if($this->BlogModel->isAlreadyConfirm($credentials))
						{
							$data['message']="You are Not Confirmed Your Account Please Confirm";
							$this->load->view('user/login',$data);
						}
						else
						{
							
							$data=$this->BlogModel->login($credentials);
							if($data['result']==TRUE)
							{
								redirect('user/dashboard');
							}
							else
							{
								$data['message']="Invalid Login Credentials Entered";
								$this->load->view('user/login',$data);
							}
						}
					}
					else
					{
						$data['message']="You Have Not Registered Your Account Please Register";
						$this->load->view('user/login',$data);
					}
				}
				
			}
			else
			{
				$this->load->view('user/login');
			}
			
		}
		
		
	}
}