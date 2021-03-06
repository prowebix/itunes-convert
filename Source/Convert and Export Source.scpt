FasdUAS 1.101.10   ��   ��    k             l      ��  ��   %
"Convert and Export" for iTunes
Originally written by Doug Adams (dougadams@mac.com)
Modified by Kelly Koehn (kkoehn@x95.us)

This script requires the use of kid3 for ID3 modification.  This can be downloaded here: http://kid3.sourceforge.net/
Simply download and copy to the Applications folder.

Tested on Yosemite (10.10) with iTunes 12.1.0.50 and kid3 3.2.0.

=========

TODO:
- Add progress bar during track work
- Ensure that progress window stays up during progress (leave iTunes in background)
- Bring finished window to front
- Remove hard coded kid3 links in case the application changes something

=========

Updated by Kelly Koehn
v3.6 March 23, 2015
- Add feature to export album artwork for non-MP3 albums.  Fixes issue where iTunes purchases (mostly AAC tracks) would have blank album artwork.
- Replaces/fixes ID3 when exporting to MP3
- Add cancel buttons to all available modal windows
- Cleaned up window titles
- Created custom function for cleaning up quoted track names during ID3 repair

Updated by Kelly Koehn
v3.5 February 19, 2015
- Added ability to maintain playlist order through incremental track numbering

Updated by Kelly Koehn
v3.4 February 10, 2015
- Added AAC export functions
- Added ability to bypass encoding functionality for exporting raw files (AAC/MP3)

Updated by Kelly Koehn
v3.3 October 7, 2014
- Remove some forbidden characters due to improved file systems
- Added prompt to place items into folders based on artist name or not

Updated by Kelly Koehn
v3.2 August 21, 2014
- Added timeout to processing section
- Cleaned up old lines of code
- Added additional debug messages where needed to track progress through script
- Further 10.9 compatibility adjustments
- Added error numbers to messages
- Note regarding 10.9 and iTunes -- YOU MUST RUN THIS AS AN APPLICATION!  Do not attempt
  to run this inside iTunes as a script or it will give you a 1712 AppleEvent time out.  Simply export
  the script as an Application (changing name, of course) and you are good to go.
  Source: http://forums.ilounge.com/applescripts-itunes-mac/245120-need-help-add-tracks-files-via-applescript.html
  
Updated by Kelly Koehn
v3.1 July 4, 2014
- Added support for 10.9 or higher
- Added 'my' to function CleanName calls
- Fixed done dialog
- Added some debug dialogs (commented out)
- Reworked file skipping code

Updated by Kelly Koehn
v3.0 July 22, 2012
- Added new Artist - Name.ext naming convention
- Does not convert MP3 files, just copies them
- Fixes file names that do not conform to POSIX standards
- Mutes audio during conversion and unmutes later

=========

v2.0 july 28, 2011
- updated for Lion compatibility (will not run on PPC machines without re-compiling and saving)

v1.1 apr 17 05
- fixed a bug which prevented the converted file from being moved properly

v1.0 apr 13 05
- initial release


     � 	 	> 
 " C o n v e r t   a n d   E x p o r t "   f o r   i T u n e s 
 O r i g i n a l l y   w r i t t e n   b y   D o u g   A d a m s   ( d o u g a d a m s @ m a c . c o m ) 
 M o d i f i e d   b y   K e l l y   K o e h n   ( k k o e h n @ x 9 5 . u s ) 
 
 T h i s   s c r i p t   r e q u i r e s   t h e   u s e   o f   k i d 3   f o r   I D 3   m o d i f i c a t i o n .     T h i s   c a n   b e   d o w n l o a d e d   h e r e :   h t t p : / / k i d 3 . s o u r c e f o r g e . n e t / 
 S i m p l y   d o w n l o a d   a n d   c o p y   t o   t h e   A p p l i c a t i o n s   f o l d e r . 
 
 T e s t e d   o n   Y o s e m i t e   ( 1 0 . 1 0 )   w i t h   i T u n e s   1 2 . 1 . 0 . 5 0   a n d   k i d 3   3 . 2 . 0 . 
 
 = = = = = = = = = 
 
 T O D O : 
 -   A d d   p r o g r e s s   b a r   d u r i n g   t r a c k   w o r k 
 -   E n s u r e   t h a t   p r o g r e s s   w i n d o w   s t a y s   u p   d u r i n g   p r o g r e s s   ( l e a v e   i T u n e s   i n   b a c k g r o u n d ) 
 -   B r i n g   f i n i s h e d   w i n d o w   t o   f r o n t 
 -   R e m o v e   h a r d   c o d e d   k i d 3   l i n k s   i n   c a s e   t h e   a p p l i c a t i o n   c h a n g e s   s o m e t h i n g 
 
 = = = = = = = = = 
 
 U p d a t e d   b y   K e l l y   K o e h n 
 v 3 . 6   M a r c h   2 3 ,   2 0 1 5 
 -   A d d   f e a t u r e   t o   e x p o r t   a l b u m   a r t w o r k   f o r   n o n - M P 3   a l b u m s .     F i x e s   i s s u e   w h e r e   i T u n e s   p u r c h a s e s   ( m o s t l y   A A C   t r a c k s )   w o u l d   h a v e   b l a n k   a l b u m   a r t w o r k . 
 -   R e p l a c e s / f i x e s   I D 3   w h e n   e x p o r t i n g   t o   M P 3 
 -   A d d   c a n c e l   b u t t o n s   t o   a l l   a v a i l a b l e   m o d a l   w i n d o w s 
 -   C l e a n e d   u p   w i n d o w   t i t l e s 
 -   C r e a t e d   c u s t o m   f u n c t i o n   f o r   c l e a n i n g   u p   q u o t e d   t r a c k   n a m e s   d u r i n g   I D 3   r e p a i r 
 
 U p d a t e d   b y   K e l l y   K o e h n 
 v 3 . 5   F e b r u a r y   1 9 ,   2 0 1 5 
 -   A d d e d   a b i l i t y   t o   m a i n t a i n   p l a y l i s t   o r d e r   t h r o u g h   i n c r e m e n t a l   t r a c k   n u m b e r i n g 
 
 U p d a t e d   b y   K e l l y   K o e h n 
 v 3 . 4   F e b r u a r y   1 0 ,   2 0 1 5 
 -   A d d e d   A A C   e x p o r t   f u n c t i o n s 
 -   A d d e d   a b i l i t y   t o   b y p a s s   e n c o d i n g   f u n c t i o n a l i t y   f o r   e x p o r t i n g   r a w   f i l e s   ( A A C / M P 3 ) 
 
 U p d a t e d   b y   K e l l y   K o e h n 
 v 3 . 3   O c t o b e r   7 ,   2 0 1 4 
 -   R e m o v e   s o m e   f o r b i d d e n   c h a r a c t e r s   d u e   t o   i m p r o v e d   f i l e   s y s t e m s 
 -   A d d e d   p r o m p t   t o   p l a c e   i t e m s   i n t o   f o l d e r s   b a s e d   o n   a r t i s t   n a m e   o r   n o t 
 
 U p d a t e d   b y   K e l l y   K o e h n 
 v 3 . 2   A u g u s t   2 1 ,   2 0 1 4 
 -   A d d e d   t i m e o u t   t o   p r o c e s s i n g   s e c t i o n 
 -   C l e a n e d   u p   o l d   l i n e s   o f   c o d e 
 -   A d d e d   a d d i t i o n a l   d e b u g   m e s s a g e s   w h e r e   n e e d e d   t o   t r a c k   p r o g r e s s   t h r o u g h   s c r i p t 
 -   F u r t h e r   1 0 . 9   c o m p a t i b i l i t y   a d j u s t m e n t s 
 -   A d d e d   e r r o r   n u m b e r s   t o   m e s s a g e s 
 -   N o t e   r e g a r d i n g   1 0 . 9   a n d   i T u n e s   - -   Y O U   M U S T   R U N   T H I S   A S   A N   A P P L I C A T I O N !     D o   n o t   a t t e m p t 
     t o   r u n   t h i s   i n s i d e   i T u n e s   a s   a   s c r i p t   o r   i t   w i l l   g i v e   y o u   a   1 7 1 2   A p p l e E v e n t   t i m e   o u t .     S i m p l y   e x p o r t 
     t h e   s c r i p t   a s   a n   A p p l i c a t i o n   ( c h a n g i n g   n a m e ,   o f   c o u r s e )   a n d   y o u   a r e   g o o d   t o   g o . 
     S o u r c e :   h t t p : / / f o r u m s . i l o u n g e . c o m / a p p l e s c r i p t s - i t u n e s - m a c / 2 4 5 1 2 0 - n e e d - h e l p - a d d - t r a c k s - f i l e s - v i a - a p p l e s c r i p t . h t m l 
     
 U p d a t e d   b y   K e l l y   K o e h n 
 v 3 . 1   J u l y   4 ,   2 0 1 4 
 -   A d d e d   s u p p o r t   f o r   1 0 . 9   o r   h i g h e r 
 -   A d d e d   ' m y '   t o   f u n c t i o n   C l e a n N a m e   c a l l s 
 -   F i x e d   d o n e   d i a l o g 
 -   A d d e d   s o m e   d e b u g   d i a l o g s   ( c o m m e n t e d   o u t ) 
 -   R e w o r k e d   f i l e   s k i p p i n g   c o d e 
 
 U p d a t e d   b y   K e l l y   K o e h n 
 v 3 . 0   J u l y   2 2 ,   2 0 1 2 
 -   A d d e d   n e w   A r t i s t   -   N a m e . e x t   n a m i n g   c o n v e n t i o n 
 -   D o e s   n o t   c o n v e r t   M P 3   f i l e s ,   j u s t   c o p i e s   t h e m 
 -   F i x e s   f i l e   n a m e s   t h a t   d o   n o t   c o n f o r m   t o   P O S I X   s t a n d a r d s 
 -   M u t e s   a u d i o   d u r i n g   c o n v e r s i o n   a n d   u n m u t e s   l a t e r 
 
 = = = = = = = = = 
 
 v 2 . 0   j u l y   2 8 ,   2 0 1 1 
 -   u p d a t e d   f o r   L i o n   c o m p a t i b i l i t y   ( w i l l   n o t   r u n   o n   P P C   m a c h i n e s   w i t h o u t   r e - c o m p i l i n g   a n d   s a v i n g ) 
 
 v 1 . 1   a p r   1 7   0 5 
 -   f i x e d   a   b u g   w h i c h   p r e v e n t e d   t h e   c o n v e r t e d   f i l e   f r o m   b e i n g   m o v e d   p r o p e r l y 
 
 v 1 . 0   a p r   1 3   0 5 
 -   i n i t i a l   r e l e a s e 
 
 
   
  
 l     ��������  ��  ��        j     �� �� 0 mytitle myTitle  m        �   $ C o n v e r t   a n d   E x p o r t      l     ��������  ��  ��        l     ��  ��    4 .set the list of characters you want to replace     �   \ s e t   t h e   l i s t   o f   c h a r a c t e r s   y o u   w a n t   t o   r e p l a c e      l     ��  ��    ? 9disallowedChars will be replaced with the replacementChar     �   r d i s a l l o w e d C h a r s   w i l l   b e   r e p l a c e d   w i t h   t h e   r e p l a c e m e n t C h a r      l     ��   ��    ! in this case, an underscore      � ! ! 6 i n   t h i s   c a s e ,   a n   u n d e r s c o r e   " # " j    �� $�� "0 disallowedchars disallowedChars $ m     % % � & &  : #  ' ( ' l     ��������  ��  ��   (  ) * ) l     �� + ,��   + = 7anything in disallowedChars2 will be removed altogether    , � - - n a n y t h i n g   i n   d i s a l l o w e d C h a r s 2   w i l l   b e   r e m o v e d   a l t o g e t h e r *  . / . l      0 1 2 0 j    �� 3�� $0 disallowedchars2 disallowedChars2 3 m     4 4 � 5 5   1   blank    2 � 6 6    b l a n k /  7 8 7 l     �� 9 :��   9 % property disallowedChars2 : "'"    : � ; ; > p r o p e r t y   d i s a l l o w e d C h a r s 2   :   " ' " 8  < = < l     ��������  ��  ��   =  > ? > l     �� @ A��   @ A ;set the character you'd like to use to replace the invalid     A � B B v s e t   t h e   c h a r a c t e r   y o u ' d   l i k e   t o   u s e   t o   r e p l a c e   t h e   i n v a l i d   ?  C D C l     �� E F��   E - 'characters specified in disallowedChars    F � G G N c h a r a c t e r s   s p e c i f i e d   i n   d i s a l l o w e d C h a r s D  H I H j   	 �� J�� ,0 replacementcharacter replacementCharacter J m   	 
 K K � L L  _ I  M N M l     ��������  ��  ��   N  O P O l     �� Q R��   Q ( " determine if system vol was muted    R � S S D   d e t e r m i n e   i f   s y s t e m   v o l   w a s   m u t e d P  T U T l     �� V W��   V _ Y C: http://leafraker.com/2007/11/13/mute-system-volume-with-apple-script-and-quicksilver/    W � X X �   C :   h t t p : / / l e a f r a k e r . c o m / 2 0 0 7 / 1 1 / 1 3 / m u t e - s y s t e m - v o l u m e - w i t h - a p p l e - s c r i p t - a n d - q u i c k s i l v e r / U  Y Z Y l    
 [���� [ r     
 \ ] \ l     ^���� ^ e      _ _ l     `���� ` n      a b a 1    ��
�� 
mute b l     c���� c I    ������
�� .sysogtvlvlst   ��� null��  ��  ��  ��  ��  ��  ��  ��   ] o      ���� 
0 _muted  ��  ��   Z  d e d l    f���� f Z     g h���� g =    i j i o    ���� 
0 _muted   j m    ��
�� boovfals h I   ���� k
�� .aevtstvlnull��� ��� nmbr��   k �� l��
�� 
mute l m    ��
�� boovtrue��  ��  ��  ��  ��   e  m n m l     ��������  ��  ��   n  o p o l     �� q r��   q "  Fix for escaping characters    r � s s 8   F i x   f o r   e s c a p i n g   c h a r a c t e r s p  t u t l     �� v w��   v < 6 Source: http://macscripter.net/viewtopic.php?id=13471    w � x x l   S o u r c e :   h t t p : / / m a c s c r i p t e r . n e t / v i e w t o p i c . p h p ? i d = 1 3 4 7 1 u  y z y l   & {���� { r    & | } | I   "�� ~��
�� .sysontocTEXT       shor ~ m    ���� "��   } n       �  1   # %��
�� 
txdl � 1   " #��
�� 
ascr��  ��   z  � � � l  ' , ����� � r   ' , � � � m   ' ( � � � � �   � n      � � � 1   ) +��
�� 
txdl � 1   ( )��
�� 
ascr��  ��   �  � � � l     ��������  ��  ��   �  � � � l  -	 ����� � O   -	 � � � k   1	 � �  � � � I  1 6������
�� .miscactvnull��� ��� null��  ��   �  � � � Z   7 � � ����� � G   7 R � � � >  7 C � � � n   7 A � � � 1   ? A��
�� 
pKnd � n   7 ? � � � 1   = ?��
�� 
ctnr � n   7 = � � � 1   ; =��
�� 
pPly � 4  7 ;�� �
�� 
cBrW � m   9 :����  � m   A B��
�� eSrckLib � =  F N � � � 1   F K��
�� 
sele � J   K M����   � Q   U � � � � � I  X �� � �
�� .sysodlogaskr        TEXT � m   X [ � � � � � X Y o u   m u s t   s e l e c t   s o m e   t r a c k s   i n   i T u n e s   f i r s t . � �� � �
�� 
btns � J   ^ c � �  ��� � m   ^ a � � � � �  C a n c e l��   � �� � �
�� 
dflt � m   f g����  � �� � �
�� 
disp � m   j k����  � �� � �
�� 
appr � o   n s���� 0 mytitle myTitle � �� ���
�� 
givu � m   v y���� ��   � R      ������
�� .ascrerr ****      � ****��  ��   � L   � �����  ��  ��   �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � &   Prompt for direct copy function    � � � � @   P r o m p t   f o r   d i r e c t   c o p y   f u n c t i o n �  � � � l  � ��� � ���   � � � If the user selects 'yes' here, the script will directly copy files and will not re-encode those files that do not match the selected encoder type.    � � � �(   I f   t h e   u s e r   s e l e c t s   ' y e s '   h e r e ,   t h e   s c r i p t   w i l l   d i r e c t l y   c o p y   f i l e s   a n d   w i l l   n o t   r e - e n c o d e   t h o s e   f i l e s   t h a t   d o   n o t   m a t c h   t h e   s e l e c t e d   e n c o d e r   t y p e . �  � � � l  � ��� � ���   � f ` If the user selects 'no' here, it will re-encode the files based on the output type you select.    � � � � �   I f   t h e   u s e r   s e l e c t s   ' n o '   h e r e ,   i t   w i l l   r e - e n c o d e   t h e   f i l e s   b a s e d   o n   t h e   o u t p u t   t y p e   y o u   s e l e c t . �  � � � I  � ��� � �
�� .sysodlogaskr        TEXT � m   � � � � � � �� A r e   w e   d i r e c t l y   c o p y i n g   f i l e s   ( p r e s e r v i n g   c o n t e n t   t y p e )   o r   r e - e n c o d i n g   t h e m   t o   a   s i n g l e   c o n t e n t   t y p e ?     N o t e   t h a t   i f   y o u   s e l e c t   D i r e c t   C o p y   y o u   w i l l   s t i l l   h a v e   t h e   o p t i o n   t o   r e p a i r   I D 3   t a g s   a n d   a l b u m   a r t w o r k . � �� � �
�� 
btns � J   � � � �  � � � m   � � � � � � �  R e - e n c o d e �  � � � m   � � � � � � �  D i r e c t   C o p y �  ��� � m   � � � � � � �  C a n c e l��   � �� � �
�� 
dflt � m   � �����  � �� ���
�� 
appr � m   � � � � � � � $ W h a t   a r e   w e   d o i n g ?��   �  � � � Z   � � � � � � � =   � � � � � 1   � ���
�� 
rslt � K   � � � � �� ���
�� 
bhit � m   � � � � � � �  C a n c e l��   � L   � �����   �  � � � =   � � � � � 1   � ���
�� 
rslt � K   � � � � �� ���
�� 
bhit � m   � � � � � � �  R e - e n c o d e��   �  ��� � r   � � � � � m   � � � � � � �  r e - e n c o d i n g � o      ���� 0 
progaction 
progAction��   � r   � � � � � m   � � � � � � �  d i r e c t - c o p y � o      ���� 0 
progaction 
progAction �    l  � �����~��  �  �~    l  � ��}�}     Get selection of songs    � .   G e t   s e l e c t i o n   o f   s o n g s  r   � �	
	 n   � � 1   � ��|
�| 
sele 4  � ��{
�{ 
cBrW m   � ��z�z 
 o      �y�y 0 myselection mySelection  l  � ��x�x     plural for dialog    � $   p l u r a l   f o r   d i a l o g  r   � � m   � � �  s o      �w�w 0 s    Z  ��v�u =  � l  ��t�s I  ��r �q
�r .corecnte****       ****  n  �!"! 2  ��p
�p 
cobj" o   � ��o�o 0 myselection mySelection�q  �t  �s   m  �n�n  r  
#$# m  
%% �&&  $ o      �m�m 0 s  �v  �u   '(' l �l�k�j�l  �k  �j  ( )*) l �i+,�i  + - ' Get encoder information, if applicable   , �-- N   G e t   e n c o d e r   i n f o r m a t i o n ,   i f   a p p l i c a b l e* ./. r  #010 n  232 1  �h
�h 
pnam3 1  �g
�g 
pEnc1 o      �f�f 0 encoderbackup encoderBackup/ 454 r  $+676 m  $'88 �99  7 o      �e�e 20 newencodedfileextension newEncodedFileExtension5 :;: Z  ,4<=�d�c< =  ,3>?> o  ,/�b�b 0 
progaction 
progAction? m  /2@@ �AA  r e - e n c o d i n g= k  60BB CDC r  6CEFE n  6?GHG 1  ;?�a
�a 
pnamH 2  6;�`
�` 
cEncF o      �_�_ 0 
myencoders 
myEncodersD IJI l DD�^�]�\�^  �]  �\  J KLK r  D�MNM c  D�OPO l D�Q�[�ZQ I D��YRS
�Y .gtqpchltns    @   @ ns  R o  DG�X�X 0 
myencoders 
myEncodersS �WTU
�W 
prmpT b  JUVWV b  JQXYX l 	JMZ�V�UZ m  JM[[ �\\  C o n v e r t   t r a c k�V  �U  Y o  MP�T�T 0 s  W m  QT]] �^^    u s i n g . . .U �S_`
�S 
inSL_ l 
X_a�R�Qa l X_b�P�Ob c  X_cdc o  X[�N�N 0 encoderbackup encoderBackupd m  [^�M
�M 
list�P  �O  �R  �Q  ` �Lef
�L 
okbte m  begg �hh  O Kf �Kij
�K 
cnbti l 	hkk�J�Ik m  hkll �mm  C a n c e l�J  �I  j �Hno
�H 
apprn o  ns�G�G 0 mytitle myTitleo �Fpq
�F 
mlslp m  z{�E
�E boovfalsq �Dp�C
�D 
empL�C  �[  �Z  P m  ���B
�B 
ctxtN o      �A�A 0 mynewencoder myNewEncoderL rsr Z ��tu�@�?t = ��vwv o  ���>�> 0 mynewencoder myNewEncoderw m  ��xx �yy 
 f a l s eu R  ���=�<z
�= .ascrerr ****      � ****�<  z �;{�:
�; 
errn{ m  ���9�9���:  �@  �?  s |}| l ���8�7�6�8  �7  �6  } ~~ l ���5���5  � 8 2 Set file extension based on encoder type selected   � ��� d   S e t   f i l e   e x t e n s i o n   b a s e d   o n   e n c o d e r   t y p e   s e l e c t e d ��4� Z  �0����3� =  ����� o  ���2�2 0 mynewencoder myNewEncoder� m  ���� ���  M P 3   E n c o d e r� k  ���� ��� r  ����� m  ���� ���  m p 3� o      �1�1 20 newencodedfileextension newEncodedFileExtension� ��0� r  ����� m  ���� ���  M P E G   a u d i o   f i l e� o      �/�/ (0 newencodedfiletype newEncodedFileType�0  � ��� =  ����� o  ���.�. 0 mynewencoder myNewEncoder� m  ���� ���  A A C   E n c o d e r� ��� k  ���� ��� r  ����� m  ���� ���  m 4 a� o      �-�- 20 newencodedfileextension newEncodedFileExtension� ��,� r  ����� m  ���� ���  A A C   a u d i o   f i l e� o      �+�+ (0 newencodedfiletype newEncodedFileType�,  � ��� =  ����� o  ���*�* 0 mynewencoder myNewEncoder� m  ���� ���  A I F F   E n c o d e r� ��� k  ���� ��� r  ����� m  ���� ���  a i f f� o      �)�) 20 newencodedfileextension newEncodedFileExtension� ��(� r  ����� m  ���� ���  A I F F   a u d i o   f i l e� o      �'�' (0 newencodedfiletype newEncodedFileType�(  � ��� =  ����� o  ���&�& 0 mynewencoder myNewEncoder� m  ���� ���  W A V   E n c o d e r� ��� k  �� ��� r  ��� m  �� ���  w a v� o      �%�% 20 newencodedfileextension newEncodedFileExtension� ��$� r  	��� m  	�� ���  W A V   a u d i o   f i l e� o      �#�# (0 newencodedfiletype newEncodedFileType�$  � ��� =  ��� o  �"�" 0 mynewencoder myNewEncoder� m  �� ���   L o s s l e s s   E n c o d e r� ��!� k  ,�� ��� r  $��� m   �� ���  a l a c� o      � �  20 newencodedfileextension newEncodedFileExtension� ��� r  %,��� m  %(�� ��� 2 A p p l e   L o s s l e s s   a u d i o   f i l e� o      �� (0 newencodedfiletype newEncodedFileType�  �!  �3  �4  �d  �c  ; ��� l 55����  �  �  � ��� l 55����  �   Choose saving location   � ��� .   C h o o s e   s a v i n g   l o c a t i o n� ��� r  5L��� l 5H���� I 5H���
� .sysostflalis    ��� null�  � ���
� 
prmp� b  9D��� b  9@��� m  9<�� ���  M o v e   n e w   f i l e� o  <?�� 0 s  � m  @C�� ���    t o . . .�  �  �  � o      ��  0 thenewlocation theNewLocation� ��� Z Mc����� = MR   o  MP��  0 thenewlocation theNewLocation m  PQ�
� boovfals� R  U_��
� .ascrerr ****      � ****�   ��

� 
errn m  Y\�	�	���
  �  �  �  l dd����  �  �    l dd�	�   !  Set encoder, if applicable   	 �

 6   S e t   e n c o d e r ,   i f   a p p l i c a b l e  Z  d��� =  dk o  dg�� 0 
progaction 
progAction m  gj �  r e - e n c o d i n g r  n| 4  nv�
� 
cEnc o  ru� �  0 mynewencoder myNewEncoder 1  v{��
�� 
pEnc�  �    l ����������  ��  ��    l ������     Skip counter    �    S k i p   c o u n t e r  r  ��  m  ������    o      ���� 0 	skipcount 	skipCount !"! l ����������  ��  ��  " #$# l ����%&��  % * $ Prompt for artist folder separation   & �'' H   P r o m p t   f o r   a r t i s t   f o l d e r   s e p a r a t i o n$ ()( I ����*+
�� .sysodlogaskr        TEXT* m  ��,, �-- | D o   y o u   w a n t   t o   s e p a r a t e   t r a c k s   i n t o   i n d i v i d u a l   a r t i s t   f o l d e r s ?+ ��./
�� 
btns. J  ��00 121 m  ��33 �44  Y e s2 565 m  ��77 �88  N o6 9��9 m  ��:: �;;  C a n c e l��  / ��<=
�� 
dflt< m  ������ = ��>��
�� 
appr> m  ��?? �@@ 0 A r t i s t   f o l d e r   s e p a r a t i o n��  ) ABA Z  ��CDEFC =  ��GHG 1  ����
�� 
rsltH K  ��II ��J��
�� 
bhitJ m  ��KK �LL  Y e s��  D r  ��MNM m  ��OO �PP  y e sN o      ���� (0 createartistfolder createArtistFolderE QRQ =  ��STS 1  ����
�� 
rsltT K  ��UU ��V��
�� 
bhitV m  ��WW �XX  C a n c e l��  R Y��Y L  ������  ��  F r  ��Z[Z m  ��\\ �]]  n o[ o      ���� (0 createartistfolder createArtistFolderB ^_^ l ����������  ��  ��  _ `a` l ����bc��  b   Prompt for DAN-TRAX   c �dd (   P r o m p t   f o r   D A N - T R A Xa efe Z  �Hgh��ig =  ��jkj o  ������ (0 createartistfolder createArtistFolderk m  ��ll �mm  n oh k  �>nn opo I �	��qr
�� .sysodlogaskr        TEXTq m  ��ss �tt D o   y o u   w a n t   t o   e n a b l e   D A N - T R A X ?     T h i s   a l l o w s   y o u   t o   m a i n t a i n   p l a y l i s t   o r d e r i n g   b y   a d d i n g   a n   i n c r e m e n t a l   n u m b e r   t o   y o u r   t r a c k   f i l e   n a m e .     P l e a s e   n o t e   t h a t   t h i s   w i l l   b y p a s s   a n y   t r a c k - e x i s t s   f u n c t i o n a l i t y   a n d   w i l l   a l w a y s   a s s u m e   t h e   t r a c k   d o e s   n o t   e x i s t   i n   t h e   d e s t i n a t i o n .r ��uv
�� 
btnsu J  ��ww xyx m  ��zz �{{  Y e sy |}| m  ��~~ �  N o} ���� m  ���� ���  C a n c e l��  v ����
�� 
dflt� m  ������ � �����
�� 
appr� m   �� ��� . E n a b l e   D A N - T R A X   n a m i n g ?��  p ���� Z  
>����� =  
��� 1  
��
�� 
rslt� K  �� �����
�� 
bhit� m  �� ���  Y e s��  � r   ��� m  �� ���  y e s� o      ���� 0 dantrax danTrax� ��� =  #/��� 1  #&��
�� 
rslt� K  &.�� �����
�� 
bhit� m  ),�� ���  C a n c e l��  � ���� L  24����  ��  � r  7>��� m  7:�� ���  n o� o      ���� 0 dantrax danTrax��  ��  i r  AH��� m  AD�� ���  n o� o      ���� 0 dantrax danTraxf ��� l II��������  ��  ��  � ��� l II������  �   Prompt for MP3 repair   � ��� ,   P r o m p t   f o r   M P 3   r e p a i r� ��� Z  I������� l IP������ =  IP��� o  IL���� 0 
progaction 
progAction� m  LO�� ���  d i r e c t - c o p y��  ��  � k  S��� ��� I Sq����
�� .sysodlogaskr        TEXT� m  SV�� ��� D o   y o u   w a n t   t o   r e p a i r   t h e   I D 3   t a g s   ( a r t i s t ,   t i t l e ,   a l b u m )   a n d   t h e   a l b u m   a r t w o r k   f o r   M P 3   f i l e s ?     T h i s   w i l l   c a u s e   a d d i t i o n a l   d i s k   a c t i v i t y   a n d   r e q u i r e   t h e   k i d 3   p r o g r a m   t o   b e   i n s t a l l e d   i n   t h e   A p p l i c a t i o n s   f o l d e r .     T h i s   w i l l   n o t   a f f e c t   n o n - M P 3   f i l e s   ( s u c h   a s   A A C ) .� ����
�� 
btns� J  Ya�� ��� m  Y\�� ���  Y e s� ���� m  \_�� ���  N o��  � ����
�� 
dflt� m  de���� � �����
�� 
appr� m  hk�� ��� 0 R e p a i r   M P 3   t a g s / a r t w o r k ?��  � ���� Z  r������� =  r~��� 1  ru��
�� 
rslt� K  u}�� �����
�� 
bhit� m  x{�� ���  Y e s��  � r  ����� m  ���� ���  y e s� o      ���� 0 runmp3repair runMp3Repair��  � r  ����� m  ���� ���  n o� o      ���� 0 runmp3repair runMp3Repair��  ��  � r  ����� m  ���� ���  n o� o      ���� 0 runmp3repair runMp3Repair� ��� l ����������  ��  ��  � ��� r  ����� m  ������  � o      ���� 0 cnt  � ��� r  ����� m  ������ � o      ���� 0 dantraxcount dantraxCount� ��� t  ����� X  ������� k  ���� ��� Q  ������ l ������ k  ���� � � l ����������  ��  ��     l ������   #  Get track info for file name    � :   G e t   t r a c k   i n f o   f o r   f i l e   n a m e  r  ��	 n ��

 I  �������� 0 	cleanname 	CleanName �� e  �� n  �� 1  ����
�� 
pArt o  ������ 0 thetrack theTrack��  ��    f  ��	 o      ���� 0 trackartist trackArtist  r  �� n �� I  �������� 0 	cleanname 	CleanName �� e  �� n  �� 1  ����
�� 
pnam o  ������ 0 thetrack theTrack��  ��    f  �� o      ���� 0 	trackname 	trackName  l ����������  ��  ��    l ���� !��    m g These values are used for setting the ID3 tags later.  They are specially quoted for command-line use.   ! �"" �   T h e s e   v a l u e s   a r e   u s e d   f o r   s e t t i n g   t h e   I D 3   t a g s   l a t e r .     T h e y   a r e   s p e c i a l l y   q u o t e d   f o r   c o m m a n d - l i n e   u s e . #$# r  ��%&% n ��'(' I  ����)���� $0 unquotedvariable UnquotedVariable) *��* e  ��++ n  ��,-, 1  ����
�� 
pArt- o  ������ 0 thetrack theTrack��  ��  (  f  ��& o      ����  0 originalartist originalArtist$ ./. r  �010 n �232 I  ���4���� $0 unquotedvariable UnquotedVariable4 5��5 e  ��66 n  ��787 1  ����
�� 
pnam8 o  ������ 0 thetrack theTrack��  ��  3  f  ��1 o      ���� 0 originalname originalName/ 9:9 r  ;<; n =>= I  ��?���� $0 unquotedvariable UnquotedVariable? @��@ e  AA n  BCB 1  ��
�� 
pAlbC o  ���� 0 thetrack theTrack��  ��  >  f  < o      ���� 0 originalalbum originalAlbum: DED l ��������  ��  ��  E FGF r  HIH l J����J e  KK n  LML 1  ��
�� 
pKndM o  �� 0 thetrack theTrack��  ��  I o      �~�~ $0 existingfiletype existingFileTypeG NON l �}�|�{�}  �|  �{  O PQP l �zRS�z  R E ? Direct Copy: Get file extension of existing file based on type   S �TT ~   D i r e c t   C o p y :   G e t   f i l e   e x t e n s i o n   o f   e x i s t i n g   f i l e   b a s e d   o n   t y p eQ UVU Z  XWX�y�xW =  &YZY o  "�w�w 0 
progaction 
progActionZ m  "%[[ �\\  d i r e c t - c o p yX k  )T]] ^_^ l ))�v�u�t�v  �u  �t  _ `a` Z  )Rbcd�sb =  )0efe o  ),�r�r $0 existingfiletype existingFileTypef m  ,/gg �hh  M P E G   a u d i o   f i l ec r  3:iji m  36kk �ll  m p 3j o      �q�q 20 newencodedfileextension newEncodedFileExtensiond mnm =  =Dopo o  =@�p�p $0 existingfiletype existingFileTypep m  @Cqq �rr 0 P u r c h a s e d   A A C   a u d i o   f i l en s�os r  GNtut m  GJvv �ww  m 4 au o      �n�n 20 newencodedfileextension newEncodedFileExtension�o  �s  a x�mx l SS�l�k�j�l  �k  �j  �m  �y  �x  V yzy l YY�i�h�g�i  �h  �g  z {|{ l YY�f}~�f  } 6 0 Set File Exists message to no for each instance   ~ � `   S e t   F i l e   E x i s t s   m e s s a g e   t o   n o   f o r   e a c h   i n s t a n c e| ��� r  Y`��� m  Y\�� ���  n o� o      �e�e "0 trackfileexists trackFileExists� ��� l aa�d�c�b�d  �c  �b  � ��� l aa�a���a  � . ( Check if new file exists in destination   � ��� P   C h e c k   i f   n e w   f i l e   e x i s t s   i n   d e s t i n a t i o n� ��� O  a��� Z  g���`�� =  gn��� o  gj�_�_ (0 createartistfolder createArtistFolder� m  jm�� ���  y e s� Z  q����^�� I q��]��\
�] .coredoexbool        obj � c  q���� l q���[�Z� n  q���� 1  ���Y
�Y 
psxp� l q���X�W� b  q���� b  q���� b  q���� b  q���� b  q���� l q���V�U� c  q���� b  q|��� b  qx��� o  qt�T�T  0 thenewlocation theNewLocation� o  tw�S�S 0 trackartist trackArtist� m  x{�� ���  :� m  |�R
�R 
ctxt�V  �U  � o  ���Q�Q 0 trackartist trackArtist� m  ���� ���    -  � o  ���P�P 0 	trackname 	trackName� m  ���� ���  .� o  ���O�O 20 newencodedfileextension newEncodedFileExtension�X  �W  �[  �Z  � m  ���N
�N 
psxf�\  � r  ����� m  ���� ���  y e s� o      �M�M "0 trackfileexists trackFileExists�^  � r  ����� m  ���� ���  n o� o      �L�L "0 trackfileexists trackFileExists�`  � k  ��� ��� l ���K���K  � j d Skip track-exists checking if DAN-TRAX is enabled.  Assume track does not exist and convert/create.   � ��� �   S k i p   t r a c k - e x i s t s   c h e c k i n g   i f   D A N - T R A X   i s   e n a b l e d .     A s s u m e   t r a c k   d o e s   n o t   e x i s t   a n d   c o n v e r t / c r e a t e .� ��J� Z  ����I�� =  ����� o  ���H�H 0 dantrax danTrax� m  ���� ���  y e s� r  ����� m  ���� ���  n o� o      �G�G "0 trackfileexists trackFileExists�I  � Z  ����F�� I ���E��D
�E .coredoexbool        obj � c  ����� l ����C�B� n  ����� 1  ���A
�A 
psxp� l ����@�?� b  ����� b  ����� b  ����� b  ����� b  ����� l ����>�=� c  ����� o  ���<�<  0 thenewlocation theNewLocation� m  ���;
�; 
ctxt�>  �=  � o  ���:�: 0 trackartist trackArtist� m  ���� ���    -  � o  ���9�9 0 	trackname 	trackName� m  ���� ���  .� o  ���8�8 20 newencodedfileextension newEncodedFileExtension�@  �?  �C  �B  � m  ���7
�7 
psxf�D  � r  ����� m  ���� ���  y e s� o      �6�6 "0 trackfileexists trackFileExists�F  � r  ���� m  ��� ���  n o� o      �5�5 "0 trackfileexists trackFileExists�J  � m  ad���                                                                                  MACS  alis    t  Macintosh HD               ��H+  ˙
Finder.app                                                     #,�B�<        ����  	                CoreServices    �+a      �B�    ˙ˍˌ  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  � ��� l �4�3�2�4  �3  �2  � ��� l �1���1  � / ) Convert or copy track to new destination   � ��� R   C o n v e r t   o r   c o p y   t r a c k   t o   n e w   d e s t i n a t i o n� ��� Z  � �0  =   o  �/�/ "0 trackfileexists trackFileExists m   �  n o k  � 	 l �.�-�,�.  �-  �,  	 

 l �+�+   X R Placeholder value so we don't delete file if track matches and we are re-encoding    � �   P l a c e h o l d e r   v a l u e   s o   w e   d o n ' t   d e l e t e   f i l e   i f   t r a c k   m a t c h e s   a n d   w e   a r e   r e - e n c o d i n g  r   m   �  n o o      �*�* 20 sametracktypedontdelete sameTrackTypeDontDelete  l �)�(�'�)  �(  �'    l �&�&   @ : Link new track based on direct-copy or re-encoding choice    � t   L i n k   n e w   t r a c k   b a s e d   o n   d i r e c t - c o p y   o r   r e - e n c o d i n g   c h o i c e  Z  � �% =  !!"! o  �$�$ 0 
progaction 
progAction" m   ## �$$  r e - e n c o d i n g k  $h%% &'& l $$�#�"�!�#  �"  �!  ' ()( Z  $f*+� ,* l $=-��- F  $=./. l $+0��0 >  $+121 o  $'�� $0 existingfiletype existingFileType2 o  '*�� (0 newencodedfiletype newEncodedFileType�  �  / l .93��3 >  .9454 o  .1�� $0 existingfiletype existingFileType5 l 186��6 b  18787 m  1499 �::  P u r c h a s e d  8 o  47�� (0 newencodedfiletype newEncodedFileType�  �  �  �  �  �  + k  @V;; <=< l @@�>?�  > 3 - Re-encode the file with the selected encoder   ? �@@ Z   R e - e n c o d e   t h e   f i l e   w i t h   t h e   s e l e c t e d   e n c o d e r= ABA r  @NCDC n  @JEFE 4  EJ�G
� 
cobjG m  HI�� F l @EH��H I @E�I�
� .hookConvnull���     ****I o  @A�� 0 thetrack theTrack�  �  �  D o      �� 0 newtrack newTrackB J�
J r  OVKLK m  ORMM �NN  n oL o      �	�	 20 sametracktypedontdelete sameTrackTypeDontDelete�
  �   , k  YfOO PQP l YY�RS�  R - ' The file types are the same, link them   S �TT N   T h e   f i l e   t y p e s   a r e   t h e   s a m e ,   l i n k   t h e mQ UVU r  Y^WXW o  YZ�� 0 thetrack theTrackX o      �� 0 newtrack newTrackV Y�Y r  _fZ[Z m  _b\\ �]]  y e s[ o      �� 20 sametracktypedontdelete sameTrackTypeDontDelete�  ) ^�^ l gg��� �  �  �   �    _`_ =  kraba o  kn���� 0 
progaction 
progActionb m  nqcc �dd  d i r e c t - c o p y` e��e k  u|ff ghg l uu��������  ��  ��  h iji l uu��kl��  k , & Link to the existing file for copying   l �mm L   L i n k   t o   t h e   e x i s t i n g   f i l e   f o r   c o p y i n gj non r  uzpqp o  uv���� 0 thetrack theTrackq o      ���� 0 newtrack newTracko r��r l {{��������  ��  ��  ��  ��  �%   sts l ����������  ��  ��  t uvu l ����wx��  w D > Change original directory location in case file was converted   x �yy |   C h a n g e   o r i g i n a l   d i r e c t o r y   l o c a t i o n   i n   c a s e   f i l e   w a s   c o n v e r t e dv z{z r  ��|}| n ��~~ 1  ����
�� 
pLoc o  ������ 0 newtrack newTrack} o      ����  0 theoldlocation theOldLocation{ ��� l ����������  ��  ��  � ��� l ��������  �   Get type of new track   � ��� ,   G e t   t y p e   o f   n e w   t r a c k� ��� r  ����� l �������� e  ���� n  ����� 1  ����
�� 
pKnd� o  ������ 0 newtrack newTrack��  ��  � o      ���� 0 newfiletype newFileType� ��� l ����������  ��  ��  � ��� l ��������  � N H Determine if we need to copy like-type file or move converted file					   � ��� �   D e t e r m i n e   i f   w e   n e e d   t o   c o p y   l i k e - t y p e   f i l e   o r   m o v e   c o n v e r t e d   f i l e 	 	 	 	 	� ��� Z  �������� =  ����� o  ������ $0 existingfiletype existingFileType� o  ������ 0 newfiletype newFileType� r  ����� m  ���� ���  c p� o      ���� 0 trackaction trackAction��  � r  ����� m  ���� ���  m v� o      ���� 0 trackaction trackAction� ��� l ����������  ��  ��  � ��� l ��������  � * $ Create artist folder, if applicable   � ��� H   C r e a t e   a r t i s t   f o l d e r ,   i f   a p p l i c a b l e� ��� Z  �������� =  ����� o  ������ (0 createartistfolder createArtistFolder� m  ���� ���  y e s� k  �!�� ��� I �������
�� .sysoexecTEXT���     TEXT� b  ����� m  ���� ���  m k d i r   - p  � l �������� n  ����� 1  ����
�� 
strq� l �������� n  ����� 1  ����
�� 
psxp� l �������� b  ����� l �������� c  ����� o  ������  0 thenewlocation theNewLocation� m  ����
�� 
ctxt��  ��  � o  ������ 0 trackartist trackArtist��  ��  ��  ��  ��  ��  ��  � ���� I �!�����
�� .sysoexecTEXT���     TEXT� b  ���� b  ����� b  ����� b  ����� o  ������ 0 trackaction trackAction� m  ���� ���   � l �������� n  ����� 1  ����
�� 
strq� n  ����� 1  ����
�� 
psxp� o  ������  0 theoldlocation theOldLocation��  ��  � m  ���� ���   � l ������� n  ���� 1  ��
�� 
strq� l ������� n  ���� 1  ��
�� 
psxp� l ������� b  ���� b  ���� b  ���� b  ���� b  ���� l � ������ c  � ��� b  ����� b  ����� o  ������  0 thenewlocation theNewLocation� o  ������ 0 trackartist trackArtist� m  ���� ���  :� m  ����
�� 
ctxt��  ��  � o   ���� 0 trackartist trackArtist� m  �� ���    -  � o  ���� 0 	trackname 	trackName� m  �� ���  .� o  ���� 20 newencodedfileextension newEncodedFileExtension��  ��  ��  ��  ��  ��  ��  ��  ��  � Z  $������� =  $+��� o  $'���� 0 dantrax danTrax� m  '*�� �    y e s� I .u����
�� .sysoexecTEXT���     TEXT b  .q b  .E b  .A b  .5	 o  .1���� 0 trackaction trackAction	 m  14

 �    l 5@���� n  5@ 1  <@��
�� 
strq n  5< 1  8<��
�� 
psxp o  58����  0 theoldlocation theOldLocation��  ��   m  AD �    l Ep���� n  Ep 1  lp��
�� 
strq l El���� n  El 1  hl��
�� 
psxp l Eh���� b  Eh b  Ed b  E` b  E\ !  b  EX"#" b  ET$%$ b  EP&'& l EL(����( c  EL)*) o  EH����  0 thenewlocation theNewLocation* m  HK��
�� 
ctxt��  ��  ' o  LO���� 0 dantraxcount dantraxCount% m  PS++ �,,    -  # o  TW���� 0 trackartist trackArtist! m  X[-- �..    -   o  \_���� 0 	trackname 	trackName m  `c// �00  . o  dg���� 20 newencodedfileextension newEncodedFileExtension��  ��  ��  ��  ��  ��  ��  ��  � I x���1��
�� .sysoexecTEXT���     TEXT1 b  x�232 b  x�454 b  x�676 b  x898 o  x{���� 0 trackaction trackAction9 m  {~:: �;;   7 l �<����< n  �=>= 1  ����
�� 
strq> n  �?@? 1  ����
�� 
psxp@ o  �����  0 theoldlocation theOldLocation��  ��  5 m  ��AA �BB   3 l ��C����C n  ��DED 1  ����
�� 
strqE l ��F����F n  ��GHG 1  ����
�� 
psxpH l ��I����I b  ��JKJ b  ��LML b  ��NON b  ��PQP b  ��RSR l ��T����T c  ��UVU o  ������  0 thenewlocation theNewLocationV m  ���
� 
ctxt��  ��  S o  ���~�~ 0 trackartist trackArtistQ m  ��WW �XX    -  O o  ���}�} 0 	trackname 	trackNameM m  ��YY �ZZ  .K o  ���|�| 20 newencodedfileextension newEncodedFileExtension��  ��  ��  ��  ��  ��  ��  � [\[ l ���{�z�y�{  �z  �y  \ ]^] l ���x_`�x  _ � | delete the track (applies to tracks that are re-encoded and not of the same type (IE: exporting AAC -> MP3, not MP3 -> MP3)   ` �aa �   d e l e t e   t h e   t r a c k   ( a p p l i e s   t o   t r a c k s   t h a t   a r e   r e - e n c o d e d   a n d   n o t   o f   t h e   s a m e   t y p e   ( I E :   e x p o r t i n g   A A C   - >   M P 3 ,   n o t   M P 3   - >   M P 3 )^ bcb Z  ��de�w�vd l ��f�u�tf F  ��ghg =  ��iji o  ���s�s 0 
progaction 
progActionj m  ��kk �ll  r e - e n c o d i n gh =  ��mnm o  ���r�r 20 sametracktypedontdelete sameTrackTypeDontDeleten m  ��oo �pp  n o�u  �t  e I ���qq�p
�q .coredelonull���     obj q o  ���o�o 0 newtrack newTrack�p  �w  �v  c rsr l ���n�m�l�n  �m  �l  s tut l ���kvw�k  v 3 - Run only if we are repairing ID3 and artwork   w �xx Z   R u n   o n l y   i f   w e   a r e   r e p a i r i n g   I D 3   a n d   a r t w o r ku yzy Z  ��{|�j�i{ =  ��}~} o  ���h�h 0 runmp3repair runMp3Repair~ m  �� ���  y e s| k  ���� ��� l ���g�f�e�g  �f  �e  � ��� l ���d���d  �   Only process MP3 files   � ��� .   O n l y   p r o c e s s   M P 3   f i l e s� ��� Z  �����c�b� =  ����� o  ���a�a 20 newencodedfileextension newEncodedFileExtension� m  ���� ���  m p 3� k  ���� ��� l ���`�_�^�`  �_  �^  � ��� l ���]���]  �   Check if artwork exists   � ��� 0   C h e c k   i f   a r t w o r k   e x i s t s� ��� Z  �����\�[� > ����� n  ����� 2 ���Z
�Z 
cArt� o  ���Y�Y 0 thetrack theTrack� J  ���X�X  � k  ���� ��� l ���W�V�U�W  �V  �U  � ��� l ���T���T  � 1 + Get current time string for temp file name   � ��� V   G e t   c u r r e n t   t i m e   s t r i n g   f o r   t e m p   f i l e   n a m e� ��� r  ���� l ���S�R� \  ���� \  �	��� l � ��Q�P� I � �O�N�M
�O .misccurdldt    ��� null�N  �M  �Q  �P  � l  ��L�K� 4   �J�
�J 
ldt � l ��I�H� m  �� ���  1 / 1 / 1 9 7 0�I  �H  �L  �K  � l 	��G�F� I 	�E�D�C
�E .sysoGMT long   ��� null�D  �C  �G  �F  �S  �R  � o      �B�B 0 
nowseconds 
nowSeconds� ��� l �A�@�?�A  �@  �?  � ��� l �>���>  � !  Get artwork from new track   � ��� 6   G e t   a r t w o r k   f r o m   n e w   t r a c k� ��� r  "��� l ��=�<� n  ��� 1  �;
�; 
pRaw� n  ��� 4  �:�
�: 
cArt� m  �9�9 � o  �8�8 0 thetrack theTrack�=  �<  � o      �7�7 0 trackartwork trackArtwork� ��� l ##�6�5�4�6  �5  �4  � ��� l ##�3���3  � $  Open temp file for image file   � ��� <   O p e n   t e m p   f i l e   f o r   i m a g e   f i l e� ��� O #?��� r  '>��� l ':��2�1� I ':�0��
�0 .rdwropenshor       file� b  '2��� b  '.��� m  '*�� ��� 
 / t m p /� o  *-�/�/ 0 
nowseconds 
nowSeconds� m  .1�� ���  . j p g� �.��-
�. 
perm� m  56�,
�, boovtrue�-  �2  �1  � o      �+�+ 0 tmpimagefile tmpImageFile�  f  #$� ��� l @@�*���*  � { utell me to set tmpImageFile to (open for access "/Users/kkoehn/Desktop/" & nowSeconds & ".jpg" with write permission)   � ��� � t e l l   m e   t o   s e t   t m p I m a g e F i l e   t o   ( o p e n   f o r   a c c e s s   " / U s e r s / k k o e h n / D e s k t o p / "   &   n o w S e c o n d s   &   " . j p g "   w i t h   w r i t e   p e r m i s s i o n )� ��� l @@�)�(�'�)  �(  �'  � ��� l @@�&���&  �    Save artwork to temp file   � ��� 4   S a v e   a r t w o r k   t o   t e m p   f i l e� ��� l @@�%���%  �   Assumes JPEG file   � ��� $   A s s u m e s   J P E G   f i l e� ��� O  @`��� r  N_��� l N[��$�#� e  N[�� n  N[��� 1  VZ�"
�" 
pRaw� n  NV��� 4 QV�! 
�! 
cArt  m  TU� �  � o  NQ�� 0 newtrack newTrack�$  �#  � o      �� 0 artworkdata artworkData� 5  @K��
� 
capp m  DG �   c o m . a p p l e . i T u n e s
� kfrmID  �  l aa����  �  �    O  a{	 I gz�

� .rdwrwritnull���     ****
 o  gj�� 0 artworkdata artworkData �
� 
refn o  mp�� 0 tmpimagefile tmpImageFile ��
� 
wrat m  st��  �  	 m  ad�                                                                                  sevs  alis    �  Macintosh HD               ��H+  ˙System Events.app                                              ��4�M        ����  	                CoreServices    �+a      �5"�    ˙ˍˌ  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��    l ||����  �  �    l ||��     Clear existing images    � ,   C l e a r   e x i s t i n g   i m a g e s  Z  |�� =  |� o  |�� (0 createartistfolder createArtistFolder m  � �  y e s k  ��   !"! l ����
�	�  �
  �	  " #$# l ���%&�  %   Set MP3 ID3 to v2.4   & �'' (   S e t   M P 3   I D 3   t o   v 2 . 4$ ()( l ���*+�  *    Remove all artwork images   + �,, 4   R e m o v e   a l l   a r t w o r k   i m a g e s) -.- l ���/0�  / , & Add primary artwork image from iTunes   0 �11 L   A d d   p r i m a r y   a r t w o r k   i m a g e   f r o m   i T u n e s. 232 l ���45�  4 ' ! Set artist, track and album name   5 �66 B   S e t   a r t i s t ,   t r a c k   a n d   a l b u m   n a m e3 7�7 I ���8�
� .sysoexecTEXT���     TEXT8 b  ��9:9 b  ��;<; b  ��=>= b  ��?@? b  ��ABA b  ��CDC b  ��EFE b  ��GHG b  ��IJI m  ��KK �LL � / A p p l i c a t i o n s / k i d 3 . a p p / C o n t e n t s / M a c O S / k i d 3 - c l i   - c   ' t o 2 4 '   - c   ' s a v e '   - c   ' s e t   p i c t u r e : " "   " " '   - c   ' s a v e '   - c   ' s e t   p i c t u r e : " / t m p /J o  ���� 0 
nowseconds 
nowSecondsH m  ��MM �NN F . j p g "   " " '   - c   ' s a v e '   - c   ' s e t   T i t l e   "F o  ��� �  0 originalname originalNameD m  ��OO �PP & " '   - c   ' s e t   A r t i s t   "B o  ������  0 originalartist originalArtist@ m  ��QQ �RR $ " '   - c   ' s e t   A l b u m   "> o  ������ 0 originalalbum originalAlbum< m  ��SS �TT  " '   - c   ' s a v e '  : l ��U����U n  ��VWV 1  ����
�� 
strqW l ��X����X n  ��YZY 1  ����
�� 
psxpZ l ��[����[ b  ��\]\ b  ��^_^ b  ��`a` b  ��bcb b  ��ded l ��f����f c  ��ghg b  ��iji b  ��klk o  ������  0 thenewlocation theNewLocationl o  ������ 0 trackartist trackArtistj m  ��mm �nn  :h m  ����
�� 
ctxt��  ��  e o  ������ 0 trackartist trackArtistc m  ��oo �pp    -  a o  ������ 0 	trackname 	trackName_ m  ��qq �rr  .] o  ������ 20 newencodedfileextension newEncodedFileExtension��  ��  ��  ��  ��  ��  �  �  �   Z  ��st��us =  ��vwv o  ������ 0 dantrax danTraxw m  ��xx �yy  y e st k  �9zz {|{ l ����������  ��  ��  | }~} l �������     Set MP3 ID3 to v2.4   � ��� (   S e t   M P 3   I D 3   t o   v 2 . 4~ ��� l ��������  �    Remove all artwork images   � ��� 4   R e m o v e   a l l   a r t w o r k   i m a g e s� ��� l ��������  � , & Add primary artwork image from iTunes   � ��� L   A d d   p r i m a r y   a r t w o r k   i m a g e   f r o m   i T u n e s� ��� l ��������  � ' ! Set artist, track and album name   � ��� B   S e t   a r t i s t ,   t r a c k   a n d   a l b u m   n a m e� ���� I �9�����
�� .sysoexecTEXT���     TEXT� b  �5��� b  �	��� b  ���� b  ���� b  ����� b  ����� b  ����� b  ����� b  ����� m  ���� ��� � / A p p l i c a t i o n s / k i d 3 . a p p / C o n t e n t s / M a c O S / k i d 3 - c l i   - c   ' t o 2 4 '   - c   ' s a v e '   - c   ' s e t   p i c t u r e : " "   " " '   - c   ' s a v e '   - c   ' s e t   p i c t u r e : " / t m p /� o  ������ 0 
nowseconds 
nowSeconds� m  ���� ��� F . j p g "   " " '   - c   ' s a v e '   - c   ' s e t   T i t l e   "� o  ������ 0 originalname originalName� m  ���� ��� & " '   - c   ' s e t   A r t i s t   "� o  ������  0 originalartist originalArtist� m  � �� ��� $ " '   - c   ' s e t   A l b u m   "� o  ���� 0 originalalbum originalAlbum� m  �� ���  " '   - c   ' s a v e '  � l 	4������ n  	4��� 1  04��
�� 
strq� l 	0������ n  	0��� 1  ,0��
�� 
psxp� l 	,������ b  	,��� b  	(��� b  	$��� b  	 ��� b  	��� b  	��� b  	��� l 	������ c  	��� o  	����  0 thenewlocation theNewLocation� m  ��
�� 
ctxt��  ��  � o  ���� 0 dantraxcount dantraxCount� m  �� ���    -  � o  ���� 0 trackartist trackArtist� m  �� ���    -  � o   #���� 0 	trackname 	trackName� m  $'�� ���  .� o  (+���� 20 newencodedfileextension newEncodedFileExtension��  ��  ��  ��  ��  ��  ��  ��  ��  u k  <��� ��� l <<��������  ��  ��  � ��� l <<������  �   Set MP3 ID3 to v2.4   � ��� (   S e t   M P 3   I D 3   t o   v 2 . 4� ��� l <<������  �    Remove all artwork images   � ��� 4   R e m o v e   a l l   a r t w o r k   i m a g e s� ��� l <<������  � , & Add primary artwork image from iTunes   � ��� L   A d d   p r i m a r y   a r t w o r k   i m a g e   f r o m   i T u n e s� ��� l <<������  � ' ! Set artist, track and album name   � ��� B   S e t   a r t i s t ,   t r a c k   a n d   a l b u m   n a m e� ��� I <������
�� .sysoexecTEXT���     TEXT� b  <���� b  <_��� b  <[��� b  <W��� b  <S��� b  <O��� b  <K��� b  <G��� b  <C��� m  <?�� ��� � / A p p l i c a t i o n s / k i d 3 . a p p / C o n t e n t s / M a c O S / k i d 3 - c l i   - c   ' t o 2 4 '   - c   ' s a v e '   - c   ' s e t   p i c t u r e : " "   " " '   - c   ' s a v e '   - c   ' s e t   p i c t u r e : " / t m p /� o  ?B���� 0 
nowseconds 
nowSeconds� m  CF�� ��� F . j p g "   " " '   - c   ' s a v e '   - c   ' s e t   T i t l e   "� o  GJ���� 0 originalname originalName� m  KN�� ��� & " '   - c   ' s e t   A r t i s t   "� o  OR����  0 originalartist originalArtist� m  SV�� �   $ " '   - c   ' s e t   A l b u m   "� o  WZ���� 0 originalalbum originalAlbum� m  [^ �  " '   - c   ' s a v e '  � l _����� n  _� 1  ~���
�� 
strq l _~���� n  _~ 1  z~��
�� 
psxp l _z	����	 b  _z

 b  _v b  _r b  _n b  _j l _f���� c  _f o  _b����  0 thenewlocation theNewLocation m  be��
�� 
ctxt��  ��   o  fi���� 0 trackartist trackArtist m  jm �    -   o  nq���� 0 	trackname 	trackName m  ru �  . o  vy���� 20 newencodedfileextension newEncodedFileExtension��  ��  ��  ��  ��  ��  ��  � �� l ����������  ��  ��  ��    l ����������  ��  ��    l ���� !��      Close temp file   ! �""     C l o s e   t e m p   f i l e #$# O ��%&% I ����'��
�� .rdwrclosnull���     ****' o  ������ 0 tmpimagefile tmpImageFile��  &  f  ��$ ()( l ����������  ��  ��  ) *+* l ����,-��  ,   Delete temp file   - �.. "   D e l e t e   t e m p   f i l e+ /0/ I ����1��
�� .sysoexecTEXT���     TEXT1 b  ��232 b  ��454 m  ��66 �77  r m   / t m p /5 o  ������ 0 
nowseconds 
nowSeconds3 m  ��88 �99  . j p g��  0 :��: l ����������  ��  ��  ��  �\  �[  � ;��; l ����������  ��  ��  ��  �c  �b  � <��< l ����������  ��  ��  ��  �j  �i  z =��= l ����������  ��  ��  ��  �0   k  ��>> ?@? l ����������  ��  ��  @ ABA l ����CD��  C . ( Increase skip counter for final message   D �EE P   I n c r e a s e   s k i p   c o u n t e r   f o r   f i n a l   m e s s a g eB FGF r  ��HIH [  ��JKJ o  ������ 0 	skipcount 	skipCountK m  ������ I o      ���� 0 	skipcount 	skipCountG L��L l ����������  ��  ��  ��  � MNM l ����������  ��  ��  N OPO r  ��QRQ [  ��STS o  ������ 0 cnt  T m  ������ R o      �� 0 cnt  P UVU r  ��WXW [  ��YZY o  ���~�~ 0 dantraxcount dantraxCountZ m  ���}�} X o      �|�| 0 dantraxcount dantraxCountV [�{[ l ���z�y�x�z  �y  �x  �{  �   skip on failure   � �\\     s k i p   o n   f a i l u r e� R      �w]^
�w .ascrerr ****      � ****] o      �v�v 0 errmsg errMsg^ �u_�t
�u 
errn_ o      �s�s 0 n  �t  � I ���r`�q
�r .sysodlogaskr        TEXT` b  ��aba b  ��cdc b  ��efe m  ��gg �hh  E R R O R :  f o  ���p�p 0 errmsg errMsgd m  ��ii �jj  ,   N u m b e r :  b o  ���o�o 0 n  �q  � k�nk l ���m�l�k�m  �l  �k  �n  �� 0 thetrack theTrack� o  ���j�j 0 myselection mySelection� m  ���i�i  ��� lml l ���h�g�f�h  �g  �f  m non r  �	pqp 4  �	�er
�e 
cEncr o  		�d�d 0 encoderbackup encoderBackupq 1  		�c
�c 
pEnco s�bs l 		�a�`�_�a  �`  �_  �b   � m   - .tt�                                                                                  hook  alis    N  Macintosh HD               ��H+  ��
iTunes.app                                                      A��^�.        ����  	                Applications    �+a      �^�~    ��  %Macintosh HD:Applications: iTunes.app    
 i T u n e s . a p p    M a c i n t o s h   H D  Applications/iTunes.app   / ��  ��  ��   � uvu l     �^�]�\�^  �]  �\  v wxw l     �[yz�[  y &   Script is finished, show dialog   z �{{ @   S c r i p t   i s   f i n i s h e d ,   s h o w   d i a l o gx |}| l 		~�Z�Y~ r  		� m  		�� ���  s� o      �X�X 0 s  �Z  �Y  } ��� l 		+��W�V� Z 		+���U�T� = 		��� o  		�S�S 0 cnt  � m  		�R�R � r  	 	'��� m  	 	#�� ���  � o      �Q�Q 0 s  �U  �T  �W  �V  � ��� l 	,	8��P�O� O 	,	8��� I 	2	7�N�M�L
�N .miscactvnull��� ��� null�M  �L  � m  	,	/�K
�K misccura�P  �O  � ��� l 	9	z��J�I� I 	9	z�H��
�H .sysodlogaskr        TEXT� b  	9	\��� b  	9	D��� b  	9	@��� m  	9	<�� ��� 
 D o n e !� o  	<	?�G
�G 
ret � o  	@	C�F
�F 
ret � l 	D	[��E�D� b  	D	[��� b  	D	W��� b  	D	S��� b  	D	O��� b  	D	K��� o  	D	G�C�C 0 cnt  � m  	G	J�� ��� 
   f i l e� o  	K	N�B�B 0 s  � m  	O	R�� ��� 8   c o n v e r t e d / c o p i e d .     S k i p p e d  � o  	S	V�A�A 0 	skipcount 	skipCount� m  	W	Z�� ���    f i l e s .�E  �D  � �@��
�@ 
btns� l 
	_	d��?�>� J  	_	d�� ��=� m  	_	b�� ��� 
 C l o s e�=  �?  �>  � �<��
�< 
dflt� m  	g	h�;�; � �:��
�: 
disp� m  	k	l�9�9 � �8��7
�8 
appr� o  	o	t�6�6 0 mytitle myTitle�7  �J  �I  � ��� l     �5�4�3�5  �4  �3  � ��� l     �2���2  �   Unmute the audio   � ��� "   U n m u t e   t h e   a u d i o� ��� l 	{	���1�0� Z  	{	����/�.� = 	{	~��� o  	{	|�-�- 
0 _muted  � m  	|	}�,
�, boovfals� I 	�	��+�*�
�+ .aevtstvlnull��� ��� nmbr�*  � �)��(
�) 
mute� m  	�	��'
�' boovfals�(  �/  �.  �1  �0  � ��� l     �&�%�$�&  �%  �$  � ��� l     �#���#  � "  File Name Cleaning Function   � ��� 8   F i l e   N a m e   C l e a n i n g   F u n c t i o n� ��� l     �"���"  � ] W C: http://techierambles.blogspot.com/2009/04/applescript-to-automatically-replace.html   � ��� �   C :   h t t p : / / t e c h i e r a m b l e s . b l o g s p o t . c o m / 2 0 0 9 / 0 4 / a p p l e s c r i p t - t o - a u t o m a t i c a l l y - r e p l a c e . h t m l� ��� i    ��� I      �!�� �! 0 	cleanname 	CleanName� ��� o      �� 0 thename theName�  �   � k     m�� ��� l     ����  �  �  � ��� Q     j���� k    W�� ��� l   ����  �  �  � ��� r    ��� m    �� ���  � o      �� 0 newname newName� ��� Y    U������ k    P�� ��� l   ����  �  �  � ��� l   ����  � 2 ,check if the character is in disallowedChars   � ��� X c h e c k   i f   t h e   c h a r a c t e r   i s   i n   d i s a l l o w e d C h a r s� ��� l   �� �  � 7 1replace it with the replacementCharacter if it is     � b r e p l a c e   i t   w i t h   t h e   r e p l a c e m e n t C h a r a c t e r   i f   i t   i s� � Z    P l   �� E   	 o    �� "0 disallowedchars disallowedChars	 l   
��

 n     4    �	
�	 
cha  o    �� 0 i   o    �� 0 thename theName�  �
  �  �   k   ! ,  r   ! * b   ! ( o   ! "�� 0 newname newName o   " '�� ,0 replacementcharacter replacementCharacter o      �� 0 newname newName  l  + +����  �  �    l  + +� �    3 -check if the character is in disallowedChars2    � Z c h e c k   i f   t h e   c h a r a c t e r   i s   i n   d i s a l l o w e d C h a r s 2 �� l  + +����   # remove it completely if it is    � : r e m o v e   i t   c o m p l e t e l y   i f   i t   i s��    !  l  / 9"����" E  / 9#$# o   / 4���� $0 disallowedchars2 disallowedChars2$ l  4 8%����% n   4 8&'& 4   5 8��(
�� 
cha ( o   6 7���� 0 i  ' o   4 5���� 0 thename theName��  ��  ��  ��  ! )��) k   < C** +,+ r   < A-.- b   < ?/0/ o   < =���� 0 newname newName0 m   = >11 �22  . o      ���� 0 newname newName, 343 l  B B��������  ��  ��  4 565 l  B B��78��  7 : 4if the character is not in either disallowedChars or   8 �99 h i f   t h e   c h a r a c t e r   i s   n o t   i n   e i t h e r   d i s a l l o w e d C h a r s   o r6 :��: l  B B��;<��  ; 0 *disallowedChars2, keep it in the file name   < �== T d i s a l l o w e d C h a r s 2 ,   k e e p   i t   i n   t h e   f i l e   n a m e��  ��   k   F P>> ?@? r   F NABA b   F LCDC o   F G���� 0 newname newNameD n   G KEFE 4   H K��G
�� 
cha G o   I J���� 0 i  F o   G H���� 0 thename theNameB o      ���� 0 newname newName@ H��H l  O O��������  ��  ��  ��  �  � 0 i  � m   
 ���� � n    IJI 1    ��
�� 
lengJ o    ���� 0 thename theName�  � K��K l  V V��������  ��  ��  ��  � R      ��LM
�� .ascrerr ****      � ****L o      ���� 0 errmsg errMsgM ��N��
�� 
errnN o      ���� 0 n  ��  � I  _ j��O��
�� .sysodlogaskr        TEXTO b   _ fPQP b   _ dRSR b   _ bTUT m   _ `VV �WW & E R R O R   ( C l e a n N a m e ) :  U o   ` a���� 0 errmsg errMsgS m   b cXX �YY  ,   N u m b e r :  Q o   d e���� 0 n  ��  � Z[Z l  k k��������  ��  ��  [ \��\ L   k m]] o   k l���� 0 newname newName��  � ^_^ l     ��������  ��  ��  _ `a` l     ��bc��  b > 8 Function for returning non-quoted outside quoted values   c �dd p   F u n c t i o n   f o r   r e t u r n i n g   n o n - q u o t e d   o u t s i d e   q u o t e d   v a l u e sa efe i    ghg I      ��i���� $0 unquotedvariable UnquotedVariablei j��j o      ���� 0 thevar theVar��  ��  h k     2kk lml l     ��������  ��  ��  m non Q     pqrp k    ss tut r    
vwv l   x����x n    yzy 1    ��
�� 
lengz l   {����{ n    |}| 1    ��
�� 
strq} o    ���� 0 thevar theVar��  ��  ��  ��  w o      ���� 0 numchars numCharsu ~��~ l   ��������  ��  ��  ��  q R      ���
�� .ascrerr ****      � **** o      ���� 0 errmsg errMsg� �����
�� 
errn� o      ���� 0 n  ��  r I   �����
�� .sysodlogaskr        TEXT� b    ��� b    ��� b    ��� m    �� ��� 4 E R R O R   ( U n q u o t e d V a r i a b l e ) :  � o    ���� 0 errmsg errMsg� m    �� ���  ,   N u m b e r :  � o    ���� 0 n  ��  o ���� L     2�� l    1������ c     1��� n     /��� 7  # /����
�� 
cha � m   ' )���� � l  * .������ \   * .��� o   + ,���� 0 numchars numChars� m   , -���� ��  ��  � l    #������ n     #��� 1   ! #��
�� 
strq� o     !���� 0 thevar theVar��  ��  � m   / 0��
�� 
TEXT��  ��  ��  f ��� l     ��������  ��  ��  � ���� l     ��������  ��  ��  ��       	���  % 4 K�����  � ���������������� 0 mytitle myTitle�� "0 disallowedchars disallowedChars�� $0 disallowedchars2 disallowedChars2�� ,0 replacementcharacter replacementCharacter�� 0 	cleanname 	CleanName�� $0 unquotedvariable UnquotedVariable
�� .aevtoappnull  �   � ****� ������������� 0 	cleanname 	CleanName�� ����� �  ���� 0 thename theName��  � ������������ 0 thename theName�� 0 newname newName�� 0 i  �� 0 errmsg errMsg�� 0 n  � 	�����1���VX��
�� 
leng
�� 
cha �� 0 errmsg errMsg� ������
�� 
errn�� 0 n  ��  
�� .sysodlogaskr        TEXT�� n Y�E�O Mk��,Ekh b  ��/ �b  %E�OPY #b  ��/ ��%E�OPY ���/%E�OP[OY��OPW X  �%�%�%j O�� �h�~�}���|� $0 unquotedvariable UnquotedVariable�~ �{��{ �  �z�z 0 thevar theVar�}  � �y�x�w�v�y 0 thevar theVar�x 0 numchars numChars�w 0 errmsg errMsg�v 0 n  � 	�u�t�s����r�q�p
�u 
strq
�t 
leng�s 0 errmsg errMsg� �o�n�m
�o 
errn�n 0 n  �m  
�r .sysodlogaskr        TEXT
�q 
cha 
�p 
TEXT�| 3 ��,�,E�OPW X  �%�%�%j O��,[�\[Zl\Z�k2�&� �l��k�j���i
�l .aevtoappnull  �   � ****� k    	���  Y��  d��  y��  ���  ��� |�� ��� ��� ��� ��h�h  �k  �j  � �g�f�e�g 0 thetrack theTrack�f 0 errmsg errMsg�e 0 n  ��d�c�b�a�`�_�^�] �t�\�[�Z�Y�X�W�V�U ��T ��S�R�Q�P�O�N�M�L�K � � � � ��J�I�H � � ��G ��F�E�D�C%�B�A�@8�?@�>�=�<[]�;�:�9g�8l�7�6�5�4�3�2x�1�0����/���������������.�-�,,37:?KO�+W\lsz~�����*�����������)���(�'�&�%�$�#�"�!� �����[gkqv�������������������#9��M\c����������������
+-/:AWYko�����
��	����������� ��������KMOQSmoqx��������������68���gi�������������
�d .sysogtvlvlst   ��� null
�c 
mute�b 
0 _muted  
�a .aevtstvlnull��� ��� nmbr�` "
�_ .sysontocTEXT       shor
�^ 
ascr
�] 
txdl
�\ .miscactvnull��� ��� null
�[ 
cBrW
�Z 
pPly
�Y 
ctnr
�X 
pKnd
�W eSrckLib
�V 
sele
�U 
bool
�T 
btns
�S 
dflt
�R 
disp
�Q 
appr
�P 
givu�O �N 

�M .sysodlogaskr        TEXT�L  �K  �J 
�I 
rslt
�H 
bhit�G 0 
progaction 
progAction�F 0 myselection mySelection�E 0 s  
�D 
cobj
�C .corecnte****       ****
�B 
pEnc
�A 
pnam�@ 0 encoderbackup encoderBackup�? 20 newencodedfileextension newEncodedFileExtension
�> 
cEnc�= 0 
myencoders 
myEncoders
�< 
prmp
�; 
inSL
�: 
list
�9 
okbt
�8 
cnbt
�7 
mlsl
�6 
empL�5 
�4 .gtqpchltns    @   @ ns  
�3 
ctxt�2 0 mynewencoder myNewEncoder
�1 
errn�0���/ (0 newencodedfiletype newEncodedFileType
�. .sysostflalis    ��� null�-  0 thenewlocation theNewLocation�, 0 	skipcount 	skipCount�+ (0 createartistfolder createArtistFolder�* 0 dantrax danTrax�) 0 runmp3repair runMp3Repair�( 0 cnt  �' 0 dantraxcount dantraxCount�&  ��
�% 
kocl
�$ 
pArt�# 0 	cleanname 	CleanName�" 0 trackartist trackArtist�! 0 	trackname 	trackName�  $0 unquotedvariable UnquotedVariable�  0 originalartist originalArtist� 0 originalname originalName
� 
pAlb� 0 originalalbum originalAlbum� $0 existingfiletype existingFileType� "0 trackfileexists trackFileExists
� 
psxp
� 
psxf
� .coredoexbool        obj � 20 sametracktypedontdelete sameTrackTypeDontDelete
� .hookConvnull���     ****� 0 newtrack newTrack
� 
pLoc�  0 theoldlocation theOldLocation� 0 newfiletype newFileType� 0 trackaction trackAction
� 
strq
� .sysoexecTEXT���     TEXT
� .coredelonull���     obj 
� 
cArt
� .misccurdldt    ��� null
�
 
ldt 
�	 .sysoGMT long   ��� null� 0 
nowseconds 
nowSeconds
� 
pRaw� 0 trackartwork trackArtwork
� 
perm
� .rdwropenshor       file� 0 tmpimagefile tmpImageFile
� 
capp
� kfrmID  �  0 artworkdata artworkData
�� 
refn
�� 
wrat�� 
�� .rdwrwritnull���     ****
�� .rdwrclosnull���     ****�� 0 errmsg errMsg� ������
�� 
errn�� 0 n  ��  
�� misccura
�� 
ret �� �i	�*j  �,EE�O�f  *�el Y hO�j ��,FO���,FO��*j 
O*�k/�,�,�,�
 *a ,jv a & 9 ,a a a kva ka la b   a a a  W 	X  hY hOa a a a  a !mva la a "a # O_ $a %a &l  hY "_ $a %a 'l  a (E` )Y 	a *E` )O*�k/a ,E` +Oa ,E` -O_ +a .-j /k  a 0E` -Y hO*a 1,a 2,E` 3Oa 4E` 5O_ )a 6  �*a 7-a 2,E` 8O_ 8a 9a :_ -%a ;%a <_ 3a =&a >a ?a @a Aa b   a Bfa Cfa D Ea F&E` GO_ Ga H  )a Ia JlhY hO_ Ga K  a LE` 5Oa ME` NY s_ Ga O  a PE` 5Oa QE` NY W_ Ga R  a SE` 5Oa TE` NY ;_ Ga U  a VE` 5Oa WE` NY _ Ga X  a YE` 5Oa ZE` NY hY hO*a 9a [_ -%a \%l ]E` ^O_ ^f  )a Ia JlhY hO_ )a _  *a 7_ G/*a 1,FY hOjE` `Oa aa a ba ca dmva la a ea # O_ $a %a fl  a gE` hY _ $a %a il  hY 	a jE` hO_ ha k  [a la a ma na omva la a pa # O_ $a %a ql  a rE` sY _ $a %a tl  hY 	a uE` sY 	a vE` sO_ )a w  Da xa a ya zlva ka a {a # O_ $a %a |l  a }E` ~Y 	a E` ~Y 	a �E` ~OjE` �OkE` �Oa �nN_ +[a �a .l /kh  )�a �,Ek+ �E` �O)�a 2,Ek+ �E` �O)�a �,Ek+ �E` �O)�a 2,Ek+ �E` �O)�a �,Ek+ �E` �O��,EE` �O_ )a �  0_ �a �  a �E` 5Y _ �a �  a �E` 5Y hOPY hOa �E` �Oa � �_ ha �  H_ ^_ �%a �%a F&_ �%a �%_ �%a �%_ 5%a �,a �&j � a �E` �Y 	a �E` �Y Q_ sa �  a �E` �Y =_ ^a F&_ �%a �%_ �%a �%_ 5%a �,a �&j � a �E` �Y 	a �E` �UO_ �a � �a �E` �O_ )a �  I_ �_ N	 _ �a �_ N%a & �j �a .k/E` �Oa �E` �Y �E` �Oa �E` �OPY _ )a �  �E` �OPY hO_ �a �,E` �O_ ��,EE` �O_ �_ �  a �E` �Y 	a �E` �O_ ha �  ha �_ ^a F&_ �%a �,a �,%j �O_ �a �%_ �a �,a �,%a �%_ ^_ �%a �%a F&_ �%a �%_ �%a �%_ 5%a �,a �,%j �Y �_ sa �  L_ �a �%_ �a �,a �,%a �%_ ^a F&_ �%a �%_ �%a �%_ �%a �%_ 5%a �,a �,%j �Y A_ �a �%_ �a �,a �,%a �%_ ^a F&_ �%a �%_ �%a �%_ 5%a �,a �,%j �O_ )a � 	 _ �a � a & _ �j �Y hO_ ~a � �_ 5a � àa �-jv�*j �)a �a �/*j �E` �O�a �k/a �,E` �O) a �_ �%a �%a �el �E` �UO)a �a �a �0 _ �a �k/a �,EE` �UOa � _ �a �_ �a �ja � �UO_ ha �  Xa �_ �%a �%_ �%a �%_ �%a �%_ �%a �%_ ^_ �%a �%a F&_ �%a �%_ �%a �%_ 5%a �,a �,%j �Y �_ sa �  Xa �_ �%a �%_ �%a �%_ �%a �%_ �%a �%_ ^a F&_ �%a �%_ �%a �%_ �%a �%_ 5%a �,a �,%j �Y Oa �_ �%a �%_ �%a �%_ �%a �%_ �%a �%_ ^a F&_ �%a �%_ �%a �%_ 5%a �,a �,%j �OPO) 	_ �j �UOa �_ �%a �%j �OPY hOPY hOPY hOPY _ `kE` `OPO_ �kE` �O_ �kE` �OPW X a�%a%�%j OP[OY��oO*a 7_ 3/*a 1,FOPUOaE` -O_ �k  aE` -Y hOa *j 
UOa_%_%_ �a	%_ -%a
%_ `%a%%a akva ka ka b   a O�f  *�fl Y hascr  ��ޭ