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
		return $CI->config->slash_item('base_url') . 'assets/images/' . $data;
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
		return $CI->config->slash_item('base_url') . 'assets/js/' . $data;
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
		return $CI->config->slash_item('base_url') . 'assets/css/' . $data;
	}
}