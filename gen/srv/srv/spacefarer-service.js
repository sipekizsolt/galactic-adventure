module.exports = srv => {

  srv.before('CREATE', 'Spacefarer', req => {
    const data = req.data;

    if (data.stardustCollection < 100) {
      data.stardustCollection = 100;
      req.info('Stardust collection has been increased for successful travel');
    }

    if (!data.wormholeNavSkill) {
      data.wormholeNavSkill = 'Beginner';
      req.info('Wormholes need some basic skills! Skill has been set to Beginner.');
    }
  
  });

  srv.after('CREATE', 'Spacefarer', async (data) => {
    req.info(`🚀 Cosmic email sent to ${data.name}`);
  });

};