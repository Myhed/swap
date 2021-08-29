const proxyquire = require('proxyquire');
const sinon = require('sinon');
const chai = require('chai');
const { expect } = chai;
const chaiAsPromised = require('chai-as-promised');
const sinonChai = require('sinon-chai');
const promiseMysql = require('promise-mysql');
describe('wrapper app', () => {
    let functionWrapperSql;
    let sandboxStubInstance;
    before(() => {
       chai.use(chaiAsPromised);
       chai.use(sinonChai);
        sandboxStubInstance = sinon.createStubInstance(promiseMysql.createConnection);
        functionWrapperSql = proxyquire('../lib/functionsWrapperSql.js', {
            'promise-mysql': {
                createConnection: sandboxStubInstance
            }
        });
    });
    it('should be ok', () => {
        console.log(functionWrapperSql);
    })
    // describe('function insert',() => {
    //     it('should insert one user under the database', async () => {
    //         // GIVEN
    //          const email = 'my email';
    //          sandboxStubInstance.createConnection.query.calledWith(`insert(${email})`);
    //         // WHEN
    //         const result = await functionWrapperSql.insertUser({ email }); 
    //         // THEN
    //         expect(sandboxStubInstance.createConnection.query).to.have.been.calledWithExactly(email);
    //     });
    // });
});