Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67BD87B1280
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 28 Sep 2023 08:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbjI1GP4 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 28 Sep 2023 02:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjI1GP4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Sep 2023 02:15:56 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8CFD99
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Sep 2023 23:15:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qlkIf-0005M7-3R; Thu, 28 Sep 2023 08:15:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qlkIT-009W0C-Oq; Thu, 28 Sep 2023 08:14:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qlkIT-005Ytu-DX; Thu, 28 Sep 2023 08:14:49 +0200
Date:   Thu, 28 Sep 2023 08:14:49 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Nishanth Menon <nm@ti.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Mateusz Holenko <mholenko@antmicro.com>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>,
        linux-tegra@vger.kernel.org,
        "Conor.Dooley" <conor.dooley@microchip.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-riscv@lists.infradead.org,
        Karol Gugala <kgugala@antmicro.com>,
        Qiang Zhao <qiang.zhao@nxp.com>,
        Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
        Rob Herring <robh@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        Ruan Jinjie <ruanjinjie@huawei.com>,
        Yinbo Zhu <zhuyinbo@loongson.cn>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org,
        Gabriel Somlo <gsomlo@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Huisong Li <lihuisong@huawei.com>,
        Joel Stanley <joel@jms.id.au>, Sumit Gupta <sumitg@nvidia.com>,
        "zhang.songyi" <zhang.songyi@zte.com.cn>,
        Zev Weiss <zev@bewilderbeest.net>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Yang Yingliang <yangyingliang@huawei.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Krzysztof Halasa <khalasa@piap.pl>, loongarch@lists.linux.dev,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michal Simek <michal.simek@amd.com>,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        linux-kernel@vger.kernel.org,
        Shang XiaoJing <shangxiaojing@huawei.com>,
        Leo Li <leoyang.li@nxp.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-mediatek@lists.infradead.org,
        Nick Alcock <nick.alcock@oracle.com>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 00/40] soc: Convert to platform remove callback returning
 void
Message-ID: <20230928061449.xxqhyyrg6e357dn2@pengutronix.de>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
 <CACPK8XeROYz_XaB3TvUhdXm7Vm8fjC8yU+mfvA58=_FiDrBy-g@mail.gmail.com>
 <1b2fddf8-c0a6-4afa-8ad0-f280dea1607f@app.fastmail.com>
 <f4hvrslynlgmxu4a2gogc5idvumskhaalxgwildy56yqk2wz7d@lkh4swkv52mi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yfll6esgccshw4fu"
Content-Disposition: inline
In-Reply-To: <f4hvrslynlgmxu4a2gogc5idvumskhaalxgwildy56yqk2wz7d@lkh4swkv52mi>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--yfll6esgccshw4fu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 04:01:58PM -0700, Bjorn Andersson wrote:
> On Wed, Sep 27, 2023 at 10:43:16AM +0200, Arnd Bergmann wrote:
> > On Wed, Sep 27, 2023, at 04:25, Joel Stanley wrote:
> > > On Mon, 25 Sept 2023 at 09:55, Uwe Kleine-K=F6nig <u.kleine-koenig@pe=
ngutronix.de> wrote:
> > >>
> > >> this series converts all platform drivers below drivers/soc to use
> > >> .remove_new(). The motivation is to get rid of an integer return code
> > >> that is (mostly) ignored by the platform driver core and error prone=
 on
> > >> the driver side.
> > >>
> > >> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> > >> returns no value") for an extended explanation and the eventual goal.
> > >>
> > >> As there is no single maintainer team for drivers/soc, I suggest the
> > >> individual maintainers to pick up "their" patches.
> > >
> > > I'd be happy if Arnd merged the lot at once. Arnd, what do you think?
> > >
> > > If that will be too messy then I understand. I have queued the aspeed
> > > ones locally and will push that out if we decide that's the best way
> > > to go.
> >=20
> > The main downside of merging it all at once through the soc tree
> > is that there may be patches that conflict with other work going on
> > in individual drivers.
> >=20
> > What I'd suggest doing here is:
> >=20
> > - have platform maintainers pick up patches for their drivers
> >   if that is their preference for any reason
>=20
> I'd prefer this for the qcom drivers at least, please let me know if you
> would like me to proceed.

I can send a pull request as Arnd suggested. So iff you want the qcom
drivers not be a part of that PR, just make sure they appear in next
during the next week. :-)

(I'm not sure if "this" in your last quoted sentence is "platform
maintainers pick up" or "merging it all at once through the soc tree". I
think you mean the former. Still if you don't want me to pick up the
qcom patches and won't manage to make them appear in next via your tree,
I ask you to tell me explicitly to skip these in my PR.)

Best regards and thanks,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--yfll6esgccshw4fu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUVGdgACgkQj4D7WH0S
/k4H8ggAlzMNhL51l548JwUtvGIKaakJoHBLPcGIj/hsCvofuN0HLiMSEtj8Dg6K
8y1eWVR1Yl+MqkggqjwkOCCy2eX7GYvKXYBRynjaryEtuaE5wSH09zlTWvWBc/ac
XaBPBsvT6wrBDQBNG9hy4EuMwz7hTRZqp6r0nJV4SSrnor+Lh3EgudImNy82xdmh
qewYGPdP1R2M1dIIvRSxcLGWHQike9Rti3B8LNTQOTOKB4RrnNfwmPZAk+6LSRAW
ArlW9S66AzVOe1E5gY70pi4VTQ8AmegEFPOJf3ZqPVAr5s/FYfmxf7GUUM/j/BMh
7vHOjZMrtO+JkBW/lzWwgV6oKIHgtA==
=TaoJ
-----END PGP SIGNATURE-----

--yfll6esgccshw4fu--
