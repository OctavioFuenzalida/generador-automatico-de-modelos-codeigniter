<?php

/**
 *  @developed : IDATI LTDA.
 *  @author    : Octavio Fuenzalida Mora.
 *  @email     : ofuenzalida@idati.cl
 *  @File      : MY_Uri
 *  @Fecha     : 04-may-2011
 * */
class MY_URI extends CI_URI {

    function _fetch_uri_string() {
        $base_url = $this->protocol() . '://';
        $base_url .= $this->host();
        $base_url .= parse_url($this->config->item('base_url'), PHP_URL_PATH);
        $this->config->set_item('base_url', $base_url);
        parent::_fetch_uri_string();
    }

    function protocol() {
        return (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != '' && $_SERVER['HTTPS'] != 'off') ? 'https' : 'http';
    }

    function host() {
        $host = $_SERVER['HTTP_HOST'];
        if (($this->protocol() == 'https' && $_SERVER['SERVER_PORT'] != 443) || ($this->protocol() == 'http' && $_SERVER['SERVER_PORT'] != 80)) {
            $host .= ':' . $_SERVER['SERVER_PORT'];
        }
        return $host;
    }

    function domain() {
        $host = parse_url($this->protocol() . '://' . $this->host());
        return $host['host'] . (isset($host['port']) ? ':' . $host['port'] : '');
    }

}

/* End of file asdf */
/* Location: ./app/controllers/MY_Uri.php */