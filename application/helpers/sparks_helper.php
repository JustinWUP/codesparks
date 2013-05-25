<?php 
// ------------------------------------------------------------------------

/**
 * Image Url
 *
 * Returns the "image_url" based on the base_url from the config file
 *
 * @access	public
 * @return	string
 */
if ( ! function_exists('image_url'))
{
	function image_url($data)
	{
		$CI =& get_instance();
		echo $CI->config->slash_item('base_url') . 'assets/images/' . $data;
	}
}

// ------------------------------------------------------------------------

/**
 * Script Url
 *
 * Returns the "script_url" based on the base_url from the config file
 *
 * @access	public
 * @return	string
 */
if ( ! function_exists('script_url'))
{
	function script_url($data)
	{
		$CI =& get_instance();
		echo $CI->config->slash_item('base_url') . 'assets/js/' . $data;
	}
}

// ------------------------------------------------------------------------

/**
 * CSS Url
 *
 * Returns the "CSS_url" based on the base_url from the config file
 *
 * @access	public
 * @return	string
 */
if ( ! function_exists('css_url'))
{
	function css_url($data)
	{
		$CI =& get_instance();
		echo $CI->config->slash_item('base_url') . 'assets/css/' . $data;
	}
}

// ------------------------------------------------------------------------

/**
 * template loader
 *
 * Loads template. Yep.
 *
 * @access	public
 * @return	string
 */
if ( ! function_exists('template'))
{
	function template($options=array())
	{	
		$CI =& get_instance();
		$defaults = array(
			'template' => null,
			'view' => null,
		    'controller' => null,
		    'data' => array()
		  );
		$arguments = array_merge($defaults, $options);
		
		if($arguments['controller']==null){
			$arguments['controller'] = $CI->router->fetch_class(); 
		}
		if($arguments['view']==null){
			$arguments['view'] = $CI->router->fetch_method(); 
		}
		if($arguments['template']==null){
			$arguments['template'] = 'core';
		}
		echo $CI->load->view('templates/'.$arguments['template'], $arguments);
	}
}


// ------------------------------------------------------------------------

/**
 * View loader
 *
 * Loads views. Yep.
 *
 * @access	public
 * @return	string
 */
if ( ! function_exists('view'))
{
	function view($view, $options=array())
	{	
		$CI =& get_instance();
		$defaults = array(
		 	'view' => $view,
		    'controller' => null,
		    'data' => array()
		  );
		$arguments = array_merge($defaults, $options);
		
		if($arguments['controller']==null){
			$arguments['controller'] = $CI->router->fetch_class(); 
		}
		$arguments['view']='index';
		echo $CI->load->view($arguments['controller'].'/'.$arguments['view'], $arguments['data']);
	}
}



// ------------------------------------------------------------------------

/**
 * Partials
 *
 * Load yourself a nice little partial.
 *
 * @access	public
 * @return	string
 */
if ( ! function_exists('partial'))
{
	function partial($view, $options=array())
	{	
		$CI =& get_instance();
		 $defaults = array(
		    'controller' => null,
		    'data' => null
		  );
		$arguments = array_merge($defaults, $options);
		
		if($arguments['controller']==null){
			$arguments['controller'] = $CI->router->fetch_class(); 
		}
		echo $CI->load->view($arguments['controller'].'/partials/'.$view, $arguments['data']);
	}
}

