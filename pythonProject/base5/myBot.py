#pip install python-telegram-bot==13.11
import os.path

API_KEY="6153206495:AAEeZ8impe2byBWf-ibFQK6OL3g_Rgq2hEE"
from telegram.ext import Updater
from telegram.ext import MessageHandler
from telegram.ext import Filters, CommandHandler, CallbackContext
updater = Updater(token=API_KEY, use_context=True)
import os
from datetime import  datetime
def fn_save_photo(update, context:CallbackContext):
    img_dir = './img/'
    if not os.path.exists(img_dir):
        os.mkdir(img_dir)
    current = datetime.now()
    str_date = current.strftime('%Y%m%d%H%M%S')#년월일 시분초
    #file_path= os.path.join('./', 'image.png')
    file_path = os.path.join('./', str_date+'.png')
    bot = context.bot
    photo = bot.getFile(update.message.photo[-1].file_id)
    photo.download(file_path)
    update.message.reply_text('photo save')
def fn_diary(update, context):
    user_id = update.effective_chat.id
    user_text = update.message.text
    if '종로' in user_text:
        context.bot.send_message(chat_id=user_id, text="다이어리 종료")
    else:
        print("메모 쓰는 기능")
        f = open('diary.txt','a',encoding='utf-8')
        msg = user_text.replace('/d', '').strip()
        f.write(msg)
        f.writelines('\n')
        f.close()
        context.bot.send_message(chat_id=user_id, text="내용을 추가함.")


def echo(update, context):
    user_id = update.effective_chat.id
    user_text =update.message.text
    context.bot.send_message(chat_id=user_id, text=user_text)
updater = Updater(token=API_KEY, use_context=True)
echo_handler = MessageHandler(Filters.text & (~Filters.command), echo)
updater.dispatcher.add_handler(echo_handler)

diary_handler = CommandHandler('d', fn_diary)
updater.dispatcher.add_handler(diary_handler)

photo_handler = MessageHandler(Filters.photo, fn_save_photo)
updater.dispatcher.add_handler(photo_handler)

updater.start_polling()
updater.idle()