Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9CAA47A62B
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 20 Dec 2021 09:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234533AbhLTIoq (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 20 Dec 2021 03:44:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232711AbhLTIon (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Dec 2021 03:44:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E01DC061574;
        Mon, 20 Dec 2021 00:44:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 12846B80E18;
        Mon, 20 Dec 2021 08:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61C2C36AE5;
        Mon, 20 Dec 2021 08:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639989880;
        bh=farAOHRUHkY4wn804J1CSpMeG8tLSsZob7VAzmnxDZo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=A8F4gCVLwVXcC3HCPVniyIOekYCDtvujNFZdCQY+6yr2h6NDKiVic5H8ZWBW5z9Il
         8naEN6RmlxNKQS510YquSqeSVA9u+ri+srdN9Emz6gOg0QD00V+fWPr7doCdKNk1TE
         mLs3p9jf459rJMpnzrNlvFfsqC98LjmgBAhC78/H0ObnRES/raXoFclhoUJD7+U0x0
         zWdN/tF9eRVJ50TzCBl34/+i9r6fjrJWJCFY6Om0TAJ+Kce7WLhtvHEcQfabiW2tnX
         CueK0nmyi0/aD9k1NJIwdAc1zLOg+/m/WaGI1Icb2GSF5sgqWQa+0n8n7gtwxysrMD
         wQqko2de+bOXw==
Received: from cfbb000407.r.cam.camfibre.uk ([185.219.108.64] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mzEHe-00DEvk-E9; Mon, 20 Dec 2021 08:44:38 +0000
Date:   Mon, 20 Dec 2021 08:44:37 +0000
Message-ID: <87o85bwtqi.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     David Virag <virag.david003@gmail.com>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 7/7] arm64: dts: exynos: Add initial device tree support for Exynos7885 SoC
In-Reply-To: <cc27e22d9945b1ab5ccc7ef20eb36af63402ef54.camel@gmail.com>
References: <20211206153124.427102-1-virag.david003@gmail.com>
        <20211206153124.427102-8-virag.david003@gmail.com>
        <b0f95b77e335596ee567ae83c1cbe549@misterjones.org>
        <cc27e22d9945b1ab5ccc7ef20eb36af63402ef54.camel@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: virag.david003@gmail.com, semen.protsenko@linaro.org, krzysztof.kozlowski@canonical.com, robh+dt@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 19 Dec 2021 14:36:20 +0000,
David Virag <virag.david003@gmail.com> wrote:
>=20
> On Tue, 2021-12-07 at 19:42 +0000, Marc Zyngier wrote:
> > On 2021-12-06 15:31, David Virag wrote:
> > > Add initial Exynos7885 device tree nodes with dts for the Samsung=20
> > > Galaxy
> > > A8 (2018), a.k.a. "jackpotlte", with model number "SM-A530F".
> > > Currently this includes some clock support, UART support, and I2C=20
> > > nodes.
> > >=20
> > > Signed-off-by: David Virag <virag.david003@gmail.com>
> >=20
> > [...]
> >=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0psci {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "arm,psci";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0method =3D "smc";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0cpu_suspend =3D <0xc4000001>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0cpu_off =3D <0x84000002>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0cpu_on =3D <0xc4000003>;
> >=20
> > Aren't these the standard PSCI 0.2 function numbers? Can't you
> > make the compatible "arm,psci-0.2" instead?
>=20
> This is not a proper PSCI 0.2 implementation. For example 0.2 has a get
> version call which is definitely not implemented properly as after
> setting the compatible to 0.2 I get the following:
>=20
> [    0.000000] psci: PSCIv65535.65535 detected in firmware.
>=20
> Which is obviously not right.

Indeed. That's a bloody -1 returned by the firmware. Quality
implementation, as usual...

Thanks,

	M.

--=20
Without deviation from the norm, progress is not possible.
