Return-Path: <linux-samsung-soc+bounces-60-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE457F406F
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 22 Nov 2023 09:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDE151C20915
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 22 Nov 2023 08:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A00224EA;
	Wed, 22 Nov 2023 08:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pOb7ge+y"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1FFF110
	for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Nov 2023 00:42:50 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-677fe97ddf8so25069236d6.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Nov 2023 00:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700642570; x=1701247370; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xJJJ00lRDiFcS8bTCcGfNaw9iOLVdZbPikVW1utuBzM=;
        b=pOb7ge+ywADMyIl8ockp0/0pynZQ1sVBaimjIE8076IWRN7QyE5g2BjrCqLYJ50CAr
         kZ76L46uKbP7DOtn6EEdJsmyXGNJgSAqghyZTycAZsLMThvPfacnMdtrJ3opq4B7DPC0
         q82xh3EyZXkwNHV9JSMDR25dBz78dCfp/3QsT1aomxNPd/5ka6PKxunW8g94vYuxouxT
         NAMjIlLVt0dI+NiK1/mjxxX2XBjI+pDGLP3qnbI7SOgOupJWWPpaWN/hhIjerZViGRXS
         EhsYqx4TkoyZx5Zhd08/PNeJsPzxJLp9Vt6i4yA6LnWYaq+BhadXjbvbEvCouPosNuTz
         7lHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700642570; x=1701247370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJJJ00lRDiFcS8bTCcGfNaw9iOLVdZbPikVW1utuBzM=;
        b=sOIO+ZUiEKWDduKeCqh6b6+EjaJ4SBU5JYSjD1xSvCTZ7DsyxbRSSCHzHWcKTBsYrU
         nie0zETdpLzSxJJuuch+S586/z5gPVv/BpowtOLsEqBNNvVqJjGqeWAIyCy65eQfuEIe
         vDSQXaLdDtTnTY1RXBlwnEuTc11XgMMUNDb8bqEtwgjoGn+vhE03ogLTZ9CleR7d7M2a
         tOtCCcoe3Jqa3Z1mKYTo/VG5FKcjEPgVA/QpYJ7OJOGn3Hm8jDKLVtX5xUWhwmwxSPrI
         jsK+hNaDTvw/nhUBbTgpXazFI9L2iQ0je0nmU5LEyEL+cbWouWJp9ZsFd/4JfK2TDmvp
         mpJQ==
X-Gm-Message-State: AOJu0YzfDm+51Ji/D2Jn3hp1+x/W0luJRoE69fB75e6XrK+GcEUHQ89n
	rVPGTODCZzwT0WL86K1inobTFfH+MOMc1IvpFy7gww==
X-Google-Smtp-Source: AGHT+IGuE4s7BTtl86J4aY1Nuyr+QChlQ+/ghmDxMJ+Qpji0VOMTRWww7BDliDBXUH4jhsBEXFzcxCwrF5hxCi4U9KY=
X-Received: by 2002:a05:6214:f6c:b0:64f:92af:9080 with SMTP id
 iy12-20020a0562140f6c00b0064f92af9080mr1950970qvb.21.1700642569839; Wed, 22
 Nov 2023 00:42:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120212037.911774-1-peter.griffin@linaro.org>
 <20231120212037.911774-10-peter.griffin@linaro.org> <20231121151630.GA1692178-robh@kernel.org>
 <CADrjBPo4qw4eJLuGsv7aK4V7QjGR_n_MQ+W-Rrq92iATSLFHZQ@mail.gmail.com> <35990cd2-a4d3-473e-893e-aa16c1c63289@linaro.org>
In-Reply-To: <35990cd2-a4d3-473e-893e-aa16c1c63289@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 22 Nov 2023 08:42:37 +0000
Message-ID: <CADrjBPr6t16Ypdg-M-r73PNiGe0XAdeCPs6Tk=iHsU3pPA9=4w@mail.gmail.com>
Subject: Re: [PATCH v4 09/19] dt-bindings: serial: samsung: Make
 samsung,uart-fifosize required property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 22 Nov 2023 at 07:49, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/11/2023 18:15, Peter Griffin wrote:
> > Hi Rob,
> >
> > Thanks for your review.
> >
> > On Tue, 21 Nov 2023 at 15:16, Rob Herring <robh@kernel.org> wrote:
> >>
> >> On Mon, Nov 20, 2023 at 09:20:27PM +0000, Peter Griffin wrote:
> >>> Specifying samsung,uart-fifosize in both DT and driver static data is error
> >>> prone and relies on driver probe order and dt aliases to be correct.
> >>>
> >>> Additionally on many Exynos platforms these are (USI) universal serial
> >>> interfaces which can be uart, spi or i2c, so it can change per board.
> >>>
> >>> For google,gs101-uart and exynosautov9-uart make samsung,uart-fifosize a
> >>> required property. For these platforms fifosize now *only* comes from DT.
> >>>
> >>> It is hoped other Exynos platforms will also switch over time.
> >>
> >> Then allow the property on them.
> >
> > Not sure I fully understand your comment. Can you elaborate? Do you
> > mean leave the 'samsung,uart-fifosize' as an optional property like it
> > is currently even for the platforms that now require it to be present
> > to function correctly?
> >
> > I deliberately restricted the yaml change to only require this
> > property for the SoCs that already set the 'samsung,uart-fifosize'  dt
> > property. As setting the property and having the driver use what is
> > specified in DT also requires a corresponding driver update (otherwise
> > fifosize gets overwritten by the driver static data, and then becomes
> > dependent on probe order, dt aliases etc). The rationale was drivers
> > 'opt in' and add themselves to the compatibles in this patch as they
> > migrate away from obtaining fifo size from driver static data to
> > obtaining it from DT.
>
> Your code diff looks like you are adding the property only to these models.

OK, I intended to only make it a required DT property for these
models. Presumably there is a better way to achieve that.

>
> >
> >>
> >>>
> >>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> >>> ---
> >>>  .../bindings/serial/samsung_uart.yaml           | 17 +++++++++++++++++
> >>>  1 file changed, 17 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> >>> index ccc3626779d9..22a1edadc4fe 100644
> >>> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> >>> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> >>> @@ -133,6 +133,23 @@ allOf:
> >>>              - const: uart
> >>>              - const: clk_uart_baud0
> >>>
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            enum:
> >>> +              - google,gs101-uart
> >>> +              - samsung,exynosautov9-uart
> >>> +    then:
> >>> +      properties:
> >>> +        samsung,uart-fifosize:
> >>> +          description: The fifo size supported by the UART channel.
> >>> +          $ref: /schemas/types.yaml#/definitions/uint32
> >>> +          enum: [16, 64, 256]
> >>
> >> We already have 'fifo-size' in several drivers. Use that. Please move
> >> its type/description definitions to serial.yaml and make drivers just do
> >> 'fifo-size: true' if they use it.
> >
> > What do you suggest we do for the samsung,uart-fifosize property that
> > is being used upstream?
>
> Nothing, your diff is just wrong. Or at least nothing needed. Just drop
> all this properties: here and only make it required for Google GS101.

OK, so your happy with the approach just not the implementation/patch
and you don't want it updated to use fifo-size instead of
samsung,uart-fifosize

>
>
> >
> >>
> >>> +
> >>> +      required:
> >>> +       - samsung,uart-fifosize
> >>
> >> A new required property is an ABI break. Please explain why that is okay
> >> in the commit message.
> >>
> >
> > I can update the commit message to make clear there is an ABI break.
> > As mentioned above the platforms where this is now required are either
> > already setting the property or are new in this series. Is that
> > sufficient justification?
> Yes, but only first case. You need to order your patches correctly -
> first is ABI break expecting ExynopsAutov9 to provide FIFO size in DTS
> with its explanation. Second commit is adding GS101 where there is no
> ABI break.

OK, I'll drop the ExynopsAutov9 part then. I don't want to complicate
this series by introducing an ABI breakage on some other unrelated
Exynos platform.

Peter

