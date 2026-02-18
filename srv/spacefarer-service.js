module.exports = srv => {

  srv.before(['CREATE', 'UPDATE'], 'Spacefarer', req => {
    const data = req.data;

    if (req.data.originPlanet != req.user.attr.planet) {
      const err = new Error(
        'You are not allowed to create a spacefarer from another planet!'
      );
      err.status = 403;
      throw err;
    }

    if (data.stardustCollection < 100) {
      data.stardustCollection = 100;
      req.info('Stardust collection has been increased for successful travel');
    }

    if (!data.wormholeNavSkill) {
      data.wormholeNavSkill = 'Beginner';
      req.warn('Wormholes need some basic skills! Skill has been set to Beginner.');
    }

  });

  srv.after('CREATE', 'Spacefarer', (data, req) => {
    req.notify('Cosmic email sent!');
  });

};