import { Router } from 'express';
import { getUserByFirebaseCreds, getPeopleIReferred } from '#src/controllers/user/user_controller';

const userRouter = Router();

userRouter.get('/firebase/:firebase_uid', getUserByFirebaseCreds);
userRouter.get('/my-referrals/:referrer_id', getPeopleIReferred);

export default userRouter;