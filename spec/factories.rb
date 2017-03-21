FactoryGirl.define do

  factory :group_member do
    Group_id {Group.last.nil? ? create(:group).id : Group.last.id}
    sequence(:phone_number) { |n| "054668468#{n}"}
    name "MyString"
  end


  factory :group do
    user_id {User.last.nil? ?  create(:user).id : User.last.id}
    name "MyString"
  end

  factory :publication do
    version 1
  	title "MyText"
  	address "MyText"
  	type_of_collecting 1
    publisher_id {User.last.nil? ? create(:user).id : User.last.id }
  	latitude 9.99
  	longitude 9.99
  	starting_date  {1.day.ago.to_i}
  	ending_date  {1.day.from_now.to_i}
  	contact_info "MyText"
  	is_on_air true
  	active_device_dev_uuid "a0912a2f2c1a31fc"
  end

  factory :publication_report do
    publication_id {Publication.last.id}
    publication_version {Publication.last.version}
    report 3
    active_device_dev_uuid {ActiveDevice.last.dev_uuid}
    date_of_report {Time.now.to_i}
   	report_user_name "tester"
    report_contact_info "+972sfsfsfg"
  end

  factory :active_device do
  	last_location_latitude 31.87980671
    last_location_longitude 34.73339054
    is_ios true
  	remote_notification_token "909cb3d2629c81fd703e35a026d025b1f325e6174b4cb5955aa18dcbe87c3cbf"
  	dev_uuid "guyfreedman"

  	trait :android do
  		is_ios false
		  remote_notification_token "AIzaSyAa1_-biaeeGsp7oINy_2ngh08WB4VOGqI"
	    dev_uuid "a0912a2f2c1a31fc"
	  end
  end

  factory :user do
    identity_provider "facebook"
    identity_provider_user_id "facebookuseridkeyisverylong"
    identity_provider_token "facebooktokenkey"
    phone_number "0546684680"
    identity_provider_email {Time.now.to_i.to_s + "@mail.com"}
    identity_provider_user_name "guy free"
    is_logged_in true
    active_device_dev_uuid "justOnethatdoesnotexist"
    ratings nil

    trait :google do
      identity_provider "google"
    end

    trait :existing_user do
      identity_provider_email "example@mail.com"
    end

  end

  factory :feedback do
    active_device_dev_uuid "a0912a2f2c1a31fc"
    reporter_name "orr barkat"
    report "testttttt"
  end


end
