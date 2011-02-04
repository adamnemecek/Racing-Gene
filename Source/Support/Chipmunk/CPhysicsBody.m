//
//  CPhysicsBody.m
//  Racing Gene
//
//  Created by Jonathan Wight on 01/31/11.
//  Copyright 2011 toxicsoftware.com. All rights reserved.
//

#import "CPhysicsBody.h"


@implementation CPhysicsBody

@synthesize body;

+ (CPhysicsBody *)staticBody
    {
    return([[[CPhysicsBody alloc] initWithBody:cpBodyNewStatic()] autorelease]);
    }

- (id)initWithBody:(cpBody *)inBody;
    {
    if ((self = [super init]) != NULL)
        {
        body = inBody;
        body->data = self;
        }
    return(self);
    }

- (id)initWithMass:(cpFloat)inMass inertia:(cpFloat)inInertia
    {
    if ((self = [self initWithBody:cpBodyNew(inMass, inInertia)]) != NULL)
        {
        }
    return(self);
    }
    
- (void)dealloc
    {
    cpBodyFree(body);
    body = NULL;
    //
    [super dealloc];
    }
    
- (cpVect)position
    {
    return(cpBodyGetPos(self.body));
    }

- (void)setPosition:(cpVect)inPosition
    {
    cpBodySetPos(self.body, inPosition);
    }
    

- (Matrix4)modelMatrix
    {
    cpVect thePosition = cpBodyGetPos(self.body);
    return(Matrix4MakeTranslation(thePosition.x, thePosition.y, 0));
    }

@end
