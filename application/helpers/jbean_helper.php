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