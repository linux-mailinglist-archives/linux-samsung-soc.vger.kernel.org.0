Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 504E21B6587
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 23 Apr 2020 22:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbgDWUho (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 23 Apr 2020 16:37:44 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:34665 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725884AbgDWUhn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Apr 2020 16:37:43 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 69404580311;
        Thu, 23 Apr 2020 16:37:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 23 Apr 2020 16:37:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=1rgoWEglUTjk3ArPIIoAl+30lpL
        4idh7C80OCTHpmUw=; b=SAJTsuiPodXPJOLPlP7oomUce1KO9HgLp4LSXSG2q9V
        k99XrTsnVoZPCz2XKjQKD/wUosuK8MuRP1DWKzbl17A0aD9dPIcfL5Yv29wTyk/s
        MxPtd1I8auIbqrXO6sX44R4LiutPyRWiA1ti78y/EUTrpxEy1duwnEXz88RMu+Wa
        29LJ8E+3FKB4mPDCcNdNCTFAYCSjWqg98NxjT/PmRIX9XZYcDg8HGlb8Ek85mB+Y
        afP7G0NWuBm2SWYwZUxi54SkwGeEkgnt8e2iIWKGi/rdjHY2FkoWTUfZma4E6I7p
        8zBHjptMWfRwKtt/h5nnvYAnwr/EisDPFqpP7SVY4ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1rgoWE
        glUTjk3ArPIIoAl+30lpL4idh7C80OCTHpmUw=; b=FjH1HHY1SYTP/zk1w/wFGD
        SQJkRMnQfaPNqbJSWS0avw2d6sCE0ifpDAK6vqra+AzCyPNpF/s1rZ1bEwox4Tgp
        5pRbjM7eb2MuhvBXHwujlGQ6qpYXKeyP1LJNg4R8oz82cnPqnDpTB2nCKi/DI/YA
        Ks5K8dR7ic8gJjYBr7a9npZnjiKmlpoGay9ZCGbr3KF+su+cblWqDQPKYrSD3IR/
        kCSbFXIEV+Qjgu2OS5YFstcNjXDXy6Fnc7738GUpuHwryUCudVJ5gHwjTV5IveLR
        qiGMtBCk9VdHZ3Y9yphlb5ppjnApd7jwJ+f9+lE0RQcS4Xdz9gzelpUkfHYLOJ8g
        ==
X-ME-Sender: <xms:kfyhXuV9_lOcQCaGhKDLNNqO3cyD3i3DpEf_1MWSOGICGvB7_Q4laA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeelgdduudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:kfyhXhJGup0irbSm7vO_9T0yPLxTEYhpuZ2E8oHhgz9vj5BJ3Cw0kg>
    <xmx:kfyhXvKW36ehC4KYnTQbBDBeA-onlsefkaFfDRE0si9E8P2EW3ls3g>
    <xmx:kfyhXt-bSwETRMJWIWQ8-fwwZs4BZXSea5_ChbcjuZeeIB-CsnZ1CA>
    <xmx:lvyhXvcpdjm9Gmks9Zw2iUnYhWgzea6einYlDWRsnbwdwAEZC9o6sA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 632923065D59;
        Thu, 23 Apr 2020 16:37:37 -0400 (EDT)
Date:   Thu, 23 Apr 2020 22:37:35 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Philipp Rossak <embed3d@gmail.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        linux-mips@vger.kernel.org,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the
 PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Message-ID: <20200423203735.imlafyw6oz6dspev@gilmour.lan>
References: <cover.1586939718.git.hns@goldelico.com>
 <20200415101008.zxzxca2vlfsefpdv@gilmour.lan>
 <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com>
 <20200415130233.rgn7xrtwqicptke2@gilmour.lan>
 <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com>
 <10969e64-fe1f-d692-4984-4ba916bd2161@gmail.com>
 <20200420073842.nx4xb3zqvu23arkc@gilmour.lan>
 <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com>
 <20200421112129.zjmkmzo3aftksgka@gilmour.lan>
 <5749af21-e707-c998-c83b-50c48867c9e8@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uldmalad7cdsj5zk"
Content-Disposition: inline
In-Reply-To: <5749af21-e707-c998-c83b-50c48867c9e8@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--uldmalad7cdsj5zk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2020 at 06:42:17PM +0200, Philipp Rossak wrote:
> Hi,
>=20
> On 21.04.20 13:21, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Tue, Apr 21, 2020 at 11:57:33AM +0200, Philipp Rossak wrote:
> > > On 20.04.20 09:38, Maxime Ripard wrote:
> > > > Hi,
> > > >=20
> > > > On Fri, Apr 17, 2020 at 02:09:06PM +0200, Philipp Rossak wrote:
> > > > > > > I'm a bit skeptical on that one since it doesn't even list the
> > > > > > > interrupts connected to the GPU that the binding mandates.
> > > > > >=20
> > > > > > I think he left it out for a future update.
> > > > > > But best he comments himself.
> > > > >=20
> > > > > I'm currently working on those bindings. They are now 90% done, b=
ut they are
> > > > > not finished till now. Currently there is some mainline support m=
issing to
> > > > > add the full binding. The A83T and also the A31/A31s have a GPU P=
ower Off
> > > > > Gating Register in the R_PRCM module, that is not supported right=
 now in
> > > > > Mainline. The Register need to be written when the GPU is powered=
 on and
> > > > > off.
> > > > >=20
> > > > > @Maxime: I totally agree on your point that a demo needs to be pr=
ovided
> > > > > before the related DTS patches should be provided. That's the rea=
son why I
> > > > > added the gpu placeholder patches.
> > > > > Do you have an idea how a driver for the R_PRCM stuff can look li=
ke? I'm not
> > > > > that experienced with the clock driver framework.
> > > >=20
> > > > It looks like a power-domain to me, so you'd rather plug that into =
the genpd
> > > > framework.
> > >=20
> > > I had a look on genpd and I'm not really sure if that fits.
> > >=20
> > > It is basically some bit that verify that the clocks should be enable=
d or
> > > disabled.
> >=20
> > No, it can do much more than that. It's a framework to control the SoCs=
 power
> > domains, so clocks might be a part of it, but most of the time it's goi=
ng to be
> > about powering up a particular device.
> >=20
> So I think I've found now the right piece of documentation and a driver t=
hat
> implements something similar [1].
>=20
> So I will write a similar driver like linked above that only sets the rig=
ht
> bits for A83T and A31/A31s.
> Do you think this is the right approach?

That sounds about right yes

Maxime

--uldmalad7cdsj5zk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqH8jwAKCRDj7w1vZxhR
xa6OAPsG0hWkJM/X3rADW428/4uNb7tDwdYNFydI9sbl6UhzkAEAxIit7pCZ/iLs
0cgwkg9mtFDlpNF5/GCnOiGoztgoNAU=
=F7xP
-----END PGP SIGNATURE-----

--uldmalad7cdsj5zk--
