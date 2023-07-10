Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F111074CF3A
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 10 Jul 2023 09:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232291AbjGJH5F (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 10 Jul 2023 03:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbjGJH5A (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Jul 2023 03:57:00 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8515102;
        Mon, 10 Jul 2023 00:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688975816;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iNq4WB0ehO9BFDBl02287PbimM0hbhShaw3I63MKiPE=;
        b=xBknwHZXPDeZO/kIF8N+R96UwfmeWjC49WRpANzlgQEGeTKwDrcsJpEEc7IrIQrlDZUKv0
        ZffwSrGy+yeEfBA1CBXF5fpuPx3n8SInDM7nmcO+uBoeUDpyPPoFZ8zf/cnCxxE1+xc3wt
        FKuJ2KN4/KxH3qytjVx0nAYe2l9GQeo=
Message-ID: <053472d1f44ae57105ced620417616c4e82c2d81.camel@crapouillou.net>
Subject: Re: [PATCH v2 3/3] ARM: dts: exynos/i9100: Fix LCD screen's
 physical size
From:   Paul Cercueil <paul@crapouillou.net>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Date:   Mon, 10 Jul 2023 09:56:54 +0200
In-Reply-To: <48d345c2-c5fe-08e9-b8c2-8d83f826e45a@linaro.org>
References: <20230708084027.18352-1-paul@crapouillou.net>
         <20230708084027.18352-4-paul@crapouillou.net>
         <98b39071-cbfa-bc58-032e-56f6e9dd5c2a@linaro.org>
         <7672f0b65cf7d2a1bb81019417aa3fa98fbac5e3.camel@crapouillou.net>
         <48d345c2-c5fe-08e9-b8c2-8d83f826e45a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Le lundi 10 juillet 2023 =C3=A0 09:45 +0200, Krzysztof Kozlowski a =C3=A9cr=
it=C2=A0:
> On 10/07/2023 09:35, Paul Cercueil wrote:
> > Hi Krzysztof,
> >=20
> > Le lundi 10 juillet 2023 =C3=A0 08:59 +0200, Krzysztof Kozlowski a
> > =C3=A9crit=C2=A0:
> > > On 08/07/2023 10:40, Paul Cercueil wrote:
> > > > The previous values were completely bogus, and resulted in the
> > > > computed
> > > > DPI ratio being much lower than reality, causing applications
> > > > and
> > > > UIs to
> > > > misbehave.
> > > >=20
> > > > The new values were measured by myself with a ruler.
> > > >=20
> > > > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > > > Fixes: 8620cc2f99b7 ("ARM: dts: exynos: Add devicetree file for
> > > > the
> > > > Galaxy S2")
> > > > Cc: <stable@vger.kernel.org> # v5.8+
> > > > ---
> > >=20
> > > This does not apply. You rebased your work on some older
> > > version/tree,
> > > without new layout. Please work on linux-next.
> >=20
> > This patchset was based on drm-misc-next, because that's where I
> > was
> > planning to apply it; and it was extremely unlikely (but not
> > impossible, apparently) that the i9100.dts would be modified in the
> > meantime.
> >=20
> > I can rebase on linux-next, the problem then is that I then don't
> > know
> > how/where to apply the patchset.
>=20
> DTS cannot go via drm-misc-next, so if that's your intention please
> always split the patchset into separate ones. *Always*.

Noted.

Then I'll apply the patches [1/3] and [2/3] to drm-misc-next since I
have my ACKs, and re-send patch [3/3] as standalone and rebased on
linux-next.

Cheers,
-Paul
