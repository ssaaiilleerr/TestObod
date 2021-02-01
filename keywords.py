from robot.libraries.BuiltIn import BuiltIn
import random

bi = BuiltIn()
sl = BuiltIn().get_library_instance("SeleniumLibrary")


def goto_login_form():
    sl.click_link('css=div.telef > a')
    sl.location_should_be('http://obod.com.ua/login.html')
    sl.element_should_contain('css=#content > span',
                              'Регистрация/Вход в 1 клик')
    sl.element_should_contain('css=form > div > div > p',
                              'Войти в Личный Кабинет')


def next_and_check_log_on_invalid():
    sl.click_element('css=div.right > form > div > button')
    sl.location_should_be('http://obod.com.ua/login.html')
    sl.element_should_contain('css=#container > div.warning',
                              'Неправильно заполнены поля E-Mail и/или пароль!')


def goto_registration_form():
    sl.click_link('css=div.telef > a')
    sl.location_should_be('http://obod.com.ua/login.html')
    sl.element_should_contain('css=#content > span',
                              'Регистрация/Вход в 1 клик')
    sl.element_should_contain('css=p:nth-child(1) > b',
                              'Регистрация')
    sl.click_element('css=div.left > div > a')
    sl.location_should_be('http://obod.com.ua/index.php?route=account/simpleregister')
    sl.element_should_contain('css=#content > h1',
                              'Быстрая регистрация')


def next_and_check_reg_on_invalid():
    sl.click_element('css=#simpleregister > div > div > a > span')
    sl.location_should_be('http://obod.com.ua/index.php?route=account/simpleregister')
    sl.element_should_contain('css=#content > h1',
                              'Быстрая регистрация')
    sl.element_should_contain('css=tr:nth-child(1) > td.simplecheckout-customer-right > span',
                              'Ошибка в адресе электронной почты')
    sl.element_should_contain('css=tr:nth-child(2) > td.simplecheckout-customer-right > span',
                              'В пароле должно быть от 4 до 20 символов!')
    sl.element_should_contain('css=tr:nth-child(3) > td.simplecheckout-customer-right > span',
                              'Имя должно быть от 1 до 30 символов')
    sl.element_should_contain('css=tr:nth-child(4) > td.simplecheckout-customer-right > span',
                              'Телефон должен быть в формате +38(0xx)xxx-xx-xx')


def valid_login_and_check(email, password):
    sl.input_text('css=input[type=text]:nth-child(3)', email)
    sl.input_password('css= input[type=password]:nth-child(5)', password)
    sl.click_element('css=form >div > button')
    sl.location_should_be('http://obod.com.ua/index.php?route=account/tmdaccount')
    sl.element_should_contain('css=div.column3 > span.zag3', 'Мой Аккаунт')


def enter_password_only(valid_login_password):
    sl.input_password('css= input[type=password]:nth-child(5)',
                      valid_login_password)


def enter_email_only(valid_login_email):
    sl.input_password('css=input[type=text]:nth-child(3)',
                      valid_login_email)


def enter_valid_email_and_invalid_password(valid_login_email,
                                           invalid_login_password):
    sl.input_text('css=input[type=text]:nth-child(3)',
                  valid_login_email)
    sl.input_password('css= input[type=password]:nth-child(5)',
                      invalid_login_password)


def enter_invalid_email_and_valid_password(invalid_login_email,
                                           valid_login_password):
    sl.input_text('css=input[type=text]:nth-child(3)',
                  invalid_login_email)
    sl.input_password('css= input[type=password]:nth-child(5)',
                      valid_login_password)


def replacement_email_and_password(valid_login_email,
                                   valid_login_password):
    sl.input_text('css=input[type=text]:nth-child(3)',
                  valid_login_password)
    sl.input_password('css= input[type=password]:nth-child(5)',
                      valid_login_email)


def login_with_system_code_on_email(valid_login_password):
    sl.input_text('css=input[type=text]:nth-child(3)',
                  '<script>alert</script>')
    sl.input_password('css= input[type=password]:nth-child(5)',
                      valid_login_password)


def check_if_login_fields_are_saved(valid_login_email,
                                    valid_login_password):
    sl.input_text('css=input[type=text]:nth-child(3)',
                  valid_login_email)
    sl.input_password('css=input[type=password]:nth-child(5)',
                      valid_login_password)
    sl.go_back()
    sl.location_should_be('http://obod.com.ua/velomagazin-hmelnickiy.html')
    sl.element_should_contain('css=#content > h1',
                              'Веломагазин Хмельницкий')
    sl.click_link('css=div.telef > a')
    sl.location_should_be('http://obod.com.ua/login.html')
    sl.element_should_contain('css=#content > span',
                              'Регистрация/Вход в 1 клик')
    sl.element_should_contain('css=form > div > div > p',
                              'Войти в Личный Кабинет')


def registration_new_user(reg_valid_password,
                          reg_valid_name,
                          reg_valid_tel):
    reg_email_random_and_valid = 'test-obod' + str(random.randint(100, 999)) + '@mailintator.com'
    sl.input_text('css=#registration_main_email',
                  reg_email_random_and_valid)
    sl.input_password('css= input[type=password]',
                      reg_valid_password)
    sl.input_text('css=#registration_main_firstname',
                  reg_valid_name)
    sl.press_keys('css=#registration_main_telephone',
                  reg_valid_tel)
    sl.click_element('css=#simpleregister > div > div > a > span')
    sl.location_should_be('http://obod.com.ua/index.php?route=account/tmdaccount')
    sl.element_should_contain('css=div.column3 > span.zag3',
                              'Мой Аккаунт')


def registration_user_with_only_spaces_in_field():
    sl.input_text('css=#registration_main_email',
                  '     ')
    sl.input_password('css= input[type=password]',
                      '     ')
    sl.input_text('css=#registration_main_firstname',
                  '     ')
    sl.press_keys('css=#registration_main_telephone', '     ')


def registration_user_with_spaces_and_valid_data_in_field(reg_valid_password,
                                                          reg_valid_name,
                                                          reg_valid_tel):
    spcs_reg_email_random_and_valid = '  test-obod' + str(random.randint(100, 999)) + '@mailintator.com  '
    spcs_password = '  ' + reg_valid_password + '  '
    spcs_name = '  ' + reg_valid_name + '  '
    spcs_telephone = '  ' + reg_valid_tel + '  '
    sl.input_text('css=#registration_main_email',
                  spcs_reg_email_random_and_valid)
    sl.input_text('css= input[type=password]',
                  spcs_password)
    sl.input_text('css=#registration_main_firstname',
                  spcs_name)
    sl.press_keys('css=#registration_main_telephone',
                  spcs_telephone)
    sl.click_element('css=#simpleregister > div > div > a > span')
    sl.location_should_be('http://obod.com.ua/index.php?route=account/tmdaccount')
    sl.element_should_contain('css=div.column3 > span.zag3',
                              'Мой Аккаунт')


def check_if_registration_fields_are_saved(reg_valid_password,
                                           reg_valid_name,
                                           reg_valid_tel):
    reg_email_random_and_valid = 'test-obod' + str(random.randint(100, 999)) + '@mailintator.com'
    sl.input_text('css=#registration_main_email',
                  reg_email_random_and_valid)
    sl.input_text('css= input[type=password]',
                  reg_valid_password)
    sl.input_text('css=#registration_main_firstname',
                  reg_valid_name)
    sl.press_keys('css=#registration_main_telephone',
                  reg_valid_tel)
    sl.go_back()
    sl.element_should_contain('css=#content > span',
                              'Регистрация/Вход в 1 клик')
    sl.location_should_be('http://obod.com.ua/login.html')
    sl.element_should_contain('css=p:nth-child(1) > b',
                              'Регистрация')
    sl.click_link('css=div.left > div > a')
    sl.location_should_be('http://obod.com.ua/index.php?route=account/simpleregister')
    sl.element_should_contain('css=#content > h1', 'Быстрая регистрация')

def go_to_shop_bicycle_parts_page():
    sl.click_element('css=li.mega-menu-mixed.main-menu-item-3 > a > span')
    sl.location_should_be('http://obod.com.ua/zapchasti')
    sl.element_should_contain('css=#content > h1',
                              'Велозапчасти, Запчасти на Велосипед')

def go_to_shop_accessories_page():
    sl.click_element('css=li.mega-menu-mixed.main-menu-item-4 > a')
    sl.location_should_be('http://obod.com.ua/aksessuary')
    sl.element_should_contain('css=#content > h1',
                              'Аксессуары для Велосипеда')

def buy_first_place_on_shop():
    sl.click_element('css=div:nth-child(1) > div > div.product-details > div.cart > a')

def go_to_cart_page_with_product():
    # sl.mouse_down('css=#cart')
    # sl.execute_javascript('jQuery(\'div.checkout > a:nth-child(1)\').click();')
    # sl.wait_until_location_contains('http://obod.com.ua/index.php?route=checkout/simplecheckout')
    sl.go_to('http://obod.com.ua/index.php?route=checkout/simplecheckout')
    sl.location_should_be('http://obod.com.ua/index.php?route=checkout/simplecheckout')
    sl.element_should_contain('css=#content > h1',
                              'Оформление заказа')

def add_product_like_first():
    sl.click_element('css=td.quantity > img:nth-child(3)')
    sl.textfield_value_should_be('css=td.quantity > input[type=text]', '2')

def check_on_two_position_in_cart():
    sl.element_should_be_visible('css=#simplecheckout_cart > table > tbody > tr:nth-child(1)')
    sl.element_should_be_visible('css=#simplecheckout_cart > table > tbody > tr:nth-child(2)')

def delete_first_place_in_cart():
    sl.click_image('css=#simplecheckout_cart > table > tbody > tr:nth-child(1) > td.remove > img')
    sl.element_should_be_visible('css=#simplecheckout_cart > table > tbody > tr:nth-child(1)')
    sl.element_should_be_disabled('css=#simplecheckout_cart > table > tbody > tr:nth-child(2)')