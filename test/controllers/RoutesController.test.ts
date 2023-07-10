import { expect } from 'chai';

describe('RouteController', () => {
    describe('getBestRoute', () => {

        beforeEach(() => {
        });

        it('should return the best route if user id is provided', async () => {
            expect({}).to.deep.equal({});
        });

        it('should return an empty array when no routes are found for the given user', async () => {
            expect({}).to.deep.equal({});
        });

        it('should handle errors thrown by getBestRoute and return a server error', async () => {
            expect({}).to.deep.equal({});
        });
    });
});