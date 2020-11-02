require 'rails_helper'

RSpec.describe User, type: :model do
     before do
     @user = FactoryBot.build(:user)
     end
     describe '#create' do
      it "nicknameとemail、passwordとpassword_confirmation,last_name,first_name,
      last_name_kana,first_name_kanaが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      
      it "passwordが6文字以上,半角英数字混合であれば登録できる" do
        @user.password = "Ab0508"
        @user.password_confirmation = "Ab0508"
        expect(@user).to be_valid
      end

      it "passwordがpassword_confirmationが一致すると登録できる" do
        @user.password = "Ab0508"
        @user.password_confirmation = "Ab0508"
        expect(@user).to be_valid
        end
      
        it "passwordは、半角英数字混合での入力だと登録できる" do
          @user.password = "Ab0508"
          expect(@user).to be_valid
          end

      it "メールアドレスは、@を含めば登録できる" do
        @user.email = "kuma@gmail.com" 
        expect(@user).to be_valid
        end

        it "last_nameのフリガナは、全角入力であれば登録できる" do
          @user.last_name = "山田"
          expect(@user).to be_valid
         end
  
         it "first_nameのフリガナは、全角入力であれば登録できる" do
          @user.first_name = "友弥"
          expect(@user).to be_valid
         end

         it "last_name_kanaのフリガナは、全角（カタカナ）での入力では登録できる" do
          @user.last_name_kana = "ヤマダ"
          expect(@user).to be_valid
         end
  
         it "first_name_kanaのフリガナは、全角（カタカナ）での入力では登録できる" do
          @user.first_name_kana = "タロウ"
          expect(@user).to be_valid
         end

   it "nicknameが空だと登録できない" do
     @user.nickname = "" 
     @user.valid?
     expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
     it "emailが空では登録できない" do
     @user.email = ""  
     @user.valid?
     expect(@user.errors.full_messages).to include("Email can't be blank")
     end
    
     it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

     it "last_nameが空では登録できない" do
       @user.last_name = ""
       @user.valid?
      expect(@user.errors.full_messages).to include("Last name can’t be black")
     end

     it "first_nameが空では登録できない" do
      @user.first_name  = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can’t be black")
    end
     
    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ""
      @user.valid?
     expect(@user.errors.full_messages).to include("Last name kana can’t be black")
     end

     it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can’t be black")
    end

    it "birthdayが空では登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

     it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
       end

    it "passwordが存在してもpassword_confirmationが空では登録できない" do
       @user.password_confirmation = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
       end

       it "passwordがpassword_confirmationが一致してないと登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123457"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers")
        end
        
       it "last_nameのフリガナは、全角入力でなければ登録できない" do
        @user.last_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
       end

       it "first_nameのフリガナは、全角入力でなければ登録できない" do
        @user.first_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
       end

       it "last_name_kanaのフリガナは、半角（カタカナ）での入力では登録できない" do
        @user.last_name_kana = "ｱｱｱｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
       end

       it "first_name_kanaのフリガナは、半角（カタカナ）での入力では登録できない" do
        @user.first_name_kana = "ｱｱｱｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
       end
      
       it "emailが@を含まないと登録できない" do
        @user.email = "kumagmail.com"  
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
        end
      
       it "パスワードは、半角英数字混合での入力でのないと登録できない" do
       @user.password = "AAA１１１１"
       @user.valid?
        expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers")
       end

       it "重複したemailが存在する場合登録できない" do
          @user.save
           another_user = FactoryBot.build(:user)
           another_user.email = @user.email
          another_user.valid?
           expect(another_user.errors.full_messages).to include("Email has already been taken")
          end   
end
end
