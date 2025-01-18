<?php

/**
 * RajaOngkir CodeIgniter Library
 * Digunakan untuk mengkonsumsi API RajaOngkir dengan mudah
 * 
 * @author Damar Riyadi <damar@tahutek.net>
 */
defined('BASEPATH') OR exit('No direct script access allowed');
require_once 'RajaOngkir/endpoints.php';

class RajaOngkir extends Endpoints {

    private $api_key;
    private $account_type;
    protected $_ci; // Deklarasi properti untuk mendukung PHP 8.2+

    public function __construct() {
        // Pastikan bahwa PHP mendukung cURL
        if (!function_exists('curl_init')) {
            log_message('error', 'cURL Class - PHP was not built with cURL enabled. Rebuild PHP with --with-curl to use cURL.');
        }

        // Inisialisasi CodeIgniter instance
        $this->_ci = &get_instance();

        // Load konfigurasi RajaOngkir
        $this->_ci->load->config('rajaongkir', TRUE);

        // Pastikan Anda sudah memasukkan API Key di application/config/rajaongkir.php
        if ($this->_ci->config->item('rajaongkir_api_key', 'rajaongkir') == "") {
            log_message("error", "Harap masukkan API KEY Anda di config.");
        } else {
            $this->api_key = $this->_ci->config->item('rajaongkir_api_key', 'rajaongkir');
            $this->account_type = $this->_ci->config->item('rajaongkir_account_type', 'rajaongkir');
        }

        // Panggil konstruktor parent dengan API Key dan Account Type
        parent::__construct($this->api_key, $this->account_type);
    }
}
