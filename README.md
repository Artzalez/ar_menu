PD: Sorry my English, im spanish, you can pull best translations

## Gif Example
https://i.gyazo.com/7dfd903477eb8bee19264d5d9d60d0b5.mp4
*The flickering of the video is because my recording program does not record well in REDM*

## How to install

* Copy and paste ```ar_menu``` folder to ```resources```
* Add ```start ar_menu``` to your ```server.cfg``` file

## Create Menu or SubMenus

```index.html```
```html
<ul class="menu menu-example"> <!-- menu-user is id of menu, new sub menus need "menu menu-example"-->
    <li><a class="FUNCTION RIGHT HERE" href=""><span class="emoji">🔪</span>Kill</a></li>
    <li><a class="FUNCTION RIGHT HERE" href=""><span class="emoji">👋</span>Hi</a></li> <!-- You can copy this line below for create more options un menu -->
    (…)
</ul>
```

```script.js```
```javascript
    //For submenus -- Add here the code
    $('.exampleopensubmenu1').on('click', function(e) {
        e.preventDefault();
        $(".menu").removeClass('fadeIn');
        $(".menu-example").addClass('fadeIn'); // Menu Open Example: "menu menu-example" you set only "menu-example"
    });
    //For New Option -- Add here the code
    $('.example1').on('click', function(e) {
        e.preventDefault();
        $.post('http://ar_menu/example1', JSON.stringify({ //Set last url name of class or other name if u can control next in RegisterNUICallback('example1', function(data)
            id: idEnt
        }));
        $(".crosshair").removeClass('fadeIn').removeClass('active');
        $(".menu").removeClass('fadeIn');
        $.post('http://ar_menu/disablenuifocus', JSON.stringify({
            nuifocus: false
        }));
    });

```

```client.lua``` (and server.lua if have)
```lua
RegisterNUICallback('example1', function(data)
  playerPed = GetPlayerPed(-1);
		if playerPed then
            ExecuteCommand("/carry") Example code Here
		end
end)
```
```style.css```
```css
.crosshair,
.menu-car,
.menu-example, /*U Need add new Sub-menus here for not duplicate whe u show main menu*/
.menu-user,
.menu-animations {
    opacity: 0;
}
```
