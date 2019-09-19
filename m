Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34DFEB79C0
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 19 Sep 2019 14:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390389AbfISMuc (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 19 Sep 2019 08:50:32 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:51346 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389506AbfISMub (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 08:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=fuCY5wYFsKqiKoBqT3bLnd0L0pBLtKNOOZDnK4mLxa0=; b=e+Rr/SPdk1bFvJMYJxKnf8bSI
        V2DOtQYRhtN3g3HdwUHhIQNTLDcvXkw0vpVXiAaYjDShAZoLtHGfhZ0Q0a7Wi/ePaLcw4SOqQ8nID
        5gI7SaA6e9BPuDpPNIDEgK86Dd5b2l2OMHmocmDQoL3tmrrIUN5Oiw02lQBcY7u7LJSno=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAvt7-0002dH-TG; Thu, 19 Sep 2019 12:50:21 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id E25522742939; Thu, 19 Sep 2019 13:50:20 +0100 (BST)
Date:   Thu, 19 Sep 2019 13:50:20 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn clock control
Message-ID: <20190919125020.GJ3642@sirena.co.uk>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
 <20190918104634.15216-3-s.nawrocki@samsung.com>
 <20190919075924.GB13195@pi3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="L+ofChggJdETEG3Y"
Content-Disposition: inline
In-Reply-To: <20190919075924.GB13195@pi3>
X-Cookie: I'll be Grateful when they're Dead.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--L+ofChggJdETEG3Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 19, 2019 at 09:59:24AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Sep 18, 2019 at 12:46:27PM +0200, Sylwester Nawrocki wrote:
> > The WM1811/WM8994/WM8958 audio CODEC DT bindings specify two optional
> > clocks: "MCLK1", "MCLK2". Add code for getting those clocks in the MFD
> > part of the wm8994 driver so they can be further handled in the audio
> > CODEC part.

> I think these are needed only for the codec so how about getting them in
> codec's probe?

Yeah.  IIRC when these were added a machine driver was grabbing them.  I
don't think that machine driver ever made it's way upstream though.

--L+ofChggJdETEG3Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2DeYwACgkQJNaLcl1U
h9CZ/Qf/RnqP8s+fNH8XRLC3f4NOhlEUuENvy3/L25UO6SoTsonta4x2bJJcUR+q
2qmI1q9VB6m4j0cXXZomB9tyElioGlvOr+91MN4OlewIIX3g15iUftM9HDEBV4yh
+zRz2YrNQLQeXO8Dh1tb2ImAgQB5alhxuOxCi+Sx0pFKf6TtioOOCJ4Nc25daN8j
By6n3XPTWaBythxtIRrtHrJUrKits1sfbG/qIKWOpjPCPVU41KX46bx/fCcjYw31
TWfsABgUpNmsHj0ndLsw8bnUByQMC59PfiHAwdS8THTH3s5EjRnFVkfvApeTZpuT
rYxEEvYM9MT2h8jesRjQgJIim/LTdg==
=nNva
-----END PGP SIGNATURE-----

--L+ofChggJdETEG3Y--
