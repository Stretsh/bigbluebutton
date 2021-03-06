package org.bigbluebutton.core.model.users
{
  import mx.collections.ArrayCollection;
  
  public class Users2x
  {
    
    private var _users:ArrayCollection = new ArrayCollection();
    
    public function getUsers(): ArrayCollection {
      return new ArrayCollection(_users.toArray());
    }
    
    public function add(user: User2x):void {
      _users.addItem(user);
    }
    
    public function remove(userId: String):User2x {
      var index:int = getIndex(userId);
      if (index >= 0) {
        return _users.removeItemAt(index) as User2x;
      }
      
      return null;
    }
    
    public function getUserAndIndex(userId: String):Object {
      var user:User2x;
      for (var i:int = 0; i < _users.length; i++) {
        user = _users.getItemAt(i) as User2x;
        
        if (user.intId == userId) {
          return {index:i, user:user};;
        }
      }
      
      return null;      
    }
    
    public function getUser(userId:String):User2x {
      var user:User2x;
      
      for (var i:int = 0; i < _users.length; i++) {
        user = _users.getItemAt(i) as User2x;
        
        if (user.intId == userId) {
          return user;
        }
      }
      
      return null;
    }
    
    public function getUserWithExtId(extId:String):User2x {
      var user:User2x;
      
      for (var i:int = 0; i < _users.length; i++) {
        user = _users.getItemAt(i) as User2x;
        
        if (user.extId == extId) {
          return user;
        }
      }
      
      return null;
    }
    
    
    
    public function getIndex(userId: String):int {
      var user:User2x;
      for (var i:int = 0; i < _users.length; i++) {
        user = _users.getItemAt(i) as User2x;
        
        if (user.intId == userId) {
          return i;
        }
      }
      
      return -1;
    }
    
    public function getPresenter():User2x {
      for (var i:int = 0; i < _users.length; i++) {
        var user:User2x = _users.getItemAt(i) as User2x;
        
        if (user.presenter) {
          return user;
        }
      }
      
      return null;
    }
    
    public function getUserIds():Array {
      var temp:Array = new Array();
      
      for (var i:int = 0; i < _users.length; i++) {
        var user:User2x = _users.getItemAt(i) as User2x;
        temp.push(user.intId);
      }
      
      return temp;
    }
    
    public function getAvatar(userId:String):String {
      for (var i:int = 0; i < _users.length; i++) {
        var user:User2x = _users.getItemAt(i) as User2x;
        
        if (user.intId == userId) {
          return user.avatar;
        }
      }
      
      return null;
    }
    
    public function getPresenters(): Array {
      var temp: Array = new Array();
      for (var i:int = 0; i < _users.length; i++) {
        var user:User2x = _users.getItemAt(i) as User2x;
        if (user.presenter) {
          temp.push(user.intId);
        }
      }
      
      return temp;
    }
    
    public function isAnyUserLocked(): Boolean {
      for (var i:int = 0; i < _users.length; i++) {
        var user:User2x = _users.getItemAt(i) as User2x;
        if (user.locked) {
          return true;
        }
      } 
      
      return false;
    }
    
    public function setRoleForUser(userId: String, role: String): void {
      for (var i:int = 0; i < _users.length; i++) {
        var user:User2x = _users.getItemAt(i) as User2x;
        if (user.intId == userId) {
          user.role = role;
        }
      } 
    }
  }
}

