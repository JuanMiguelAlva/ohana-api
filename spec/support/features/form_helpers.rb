module Features
  module FormHelpers
    def reset_accessibility
      within_fieldset('accessibility') do
        all('input[type=checkbox]').each do |checkbox|
          uncheck checkbox[:id]
        end
      end
      click_button 'Save changes'
    end

    def set_all_accessibility
      within_fieldset('accessibility') do
        all('input[type=checkbox]').each do |checkbox|
          check checkbox[:id]
        end
      end
      click_button 'Save changes'
    end

    def add_street_address(options = {})
      click_link 'Add a street address'
      update_street_address(options)
      click_button 'Save changes'
    end

    def update_street_address(options = {})
      fill_in 'location_address_attributes_street', with: options[:street]
      fill_in 'location_address_attributes_city', with: options[:city]
      fill_in 'location_address_attributes_state', with: options[:state]
      fill_in 'location_address_attributes_zip', with: options[:zip]
      click_button 'Save changes'
    end

    def remove_street_address
      click_link 'Delete this address permanently'
      click_button 'Save changes'
    end

    def remove_mail_address
      click_link 'Delete this mailing address permanently'
      click_button 'Save changes'
    end

    def add_contact(options = {})
      click_link 'Add a contact'
      update_contact(options)
    end

    def update_contact(options = {})
      within('.contacts') do
        fill_in find(:xpath, './/input[contains(@name, "[name]")]')[:id], with: options[:name]
        fill_in find(:xpath, './/input[contains(@name, "[title]")]')[:id], with: options[:title]
        fill_in find(:xpath, './/input[contains(@name, "[email]")]')[:id], with: options[:email]
        fill_in find(:xpath, './/input[contains(@name, "[phone]")]')[:id], with: options[:phone]
        fill_in find(:xpath, './/input[contains(@name, "[fax]")]')[:id], with: options[:fax]
        fill_in find(:xpath, './/input[contains(@name, "[extension]")]')[:id], with: options[:extension]
      end
    end

    def delete_contact
      click_link 'Delete this contact permanently'
      click_button 'Save changes'
    end

    def add_fax(options = {})
      click_link 'Add a fax number'
      update_fax(options)
    end

    def update_fax(options = {})
      within('.faxes') do
        fill_in find(:xpath, './/input[contains(@name, "[number]")]')[:id], with: options[:number]
        fill_in find(:xpath, './/input[contains(@name, "[department]")]')[:id], with: options[:department]
      end
    end

    def delete_fax
      click_link 'Delete this fax permanently'
      click_button 'Save changes'
    end

    def add_two_admins
      click_link 'Add an admin email'
      fill_in 'location[admin_emails][]', with: 'moncef@foo.com'
      click_link 'Add an admin email'
      admins = all(:xpath, "//input[contains(@name, '[admin_emails]')]")
      fill_in admins[-1][:id], with: 'moncef@otherlocation.com'
      click_button 'Save changes'
    end

    def delete_all_admins
      find_link('Delete this admin permanently', match: :first).click
      find_link('Delete this admin permanently', match: :first).click
      click_button 'Save changes'
    end
  end
end
