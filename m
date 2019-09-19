Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB50B7A1D
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 19 Sep 2019 15:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732261AbfISNHh (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 19 Sep 2019 09:07:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:52238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731332AbfISNHh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 09:07:37 -0400
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 769B7222BD;
        Thu, 19 Sep 2019 13:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568898456;
        bh=7c6x6cciXw60y1MAp5qCF8JC2dTq/q+YgCB8SLyOqPk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rLANaBJ7u/o3/Au71CBT1kL7Iz1AesheSrZWNrQYU3KIhPqXcqzDRSt3TNTjU0ICC
         YtuL2Mb+8MCN3YX+aSM2MYkpVCpoXPE4NM1wK9cZcfe7oqcZVmY34xHX3NiRMA5TJ9
         dZHIzZ6pmcmn8SJbokPvWglRcXxHBKx41f5cYxfk=
Received: by mail-oi1-f176.google.com with SMTP id 83so2674122oii.1;
        Thu, 19 Sep 2019 06:07:36 -0700 (PDT)
X-Gm-Message-State: APjAAAWsjn1TeT/o0qJ62aG+s54vSCzJDIOSNNAh0PgMV/bUQN/JUBTO
        byJugJLPArmWJTDOAziRD4PVTDi6xWjaWm+rKZ4=
X-Google-Smtp-Source: APXvYqzg4w/tXFpqJXHvHB4lq08/Vt2S/re21Kogpdz8yQzifNkZReFpzmxtyPOoRYJbDiSlFhPpgOR0t+CaR7QIEm8=
X-Received: by 2002:aca:cf51:: with SMTP id f78mr2186088oig.8.1568898455647;
 Thu, 19 Sep 2019 06:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
 <20190918104634.15216-3-s.nawrocki@samsung.com> <20190919075924.GB13195@pi3> <420d3c8a-a31e-1edf-3112-b9800beace1e@samsung.com>
In-Reply-To: <420d3c8a-a31e-1edf-3112-b9800beace1e@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 19 Sep 2019 15:07:23 +0200
X-Gmail-Original-Message-ID: <CAJKOXPedjgXMfiGK=frXeynaqkAWvCcgEVqPeFoL0h8og7MXCA@mail.gmail.com>
Message-ID: <CAJKOXPedjgXMfiGK=frXeynaqkAWvCcgEVqPeFoL0h8og7MXCA@mail.gmail.com>
Subject: Re: [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn clock control
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, ckeepax@opensource.cirrus.com,
        =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= 
        <b.zolnierkie@samsung.com>, sbkim73@samsung.com,
        patches@opensource.cirrus.com, lgirdwood@gmail.com,
        robh+dt@kernel.org, broonie@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 19 Sep 2019 at 14:49, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> On 9/19/19 09:59, Krzysztof Kozlowski wrote:
> > On Wed, Sep 18, 2019 at 12:46:27PM +0200, Sylwester Nawrocki wrote:
> >> The WM1811/WM8994/WM8958 audio CODEC DT bindings specify two optional
> >> clocks: "MCLK1", "MCLK2". Add code for getting those clocks in the MFD
> >> part of the wm8994 driver so they can be further handled in the audio
> >> CODEC part.
> >
> > I think these are needed only for the codec so how about getting them in
> > codec's probe?
>
> The clocks are specified in the (I2C slave device) DT node which corresponds
> to the device as a whole and to which binds the MFD driver.  AFAICT those
> clocks are only needed by the CODEC sub-driver but in general such clocks
> could be used to provide device's system clock used by other functionalities
> than audio.  We are doing something similar for other MFD drivers already
> and I would rather stick to one pattern. IMHO it's clearer to see what
> device the clocks belong to that way.

The existing pattern is not an excuse for doing some things in a
uglier way... If we agree that these are codec-only resources, then
they should be acquired by codec driver. This is one minor step to
solve difficult inter-device dependencies which stops from reusing
parts of the code (some child of MFD heavily depends on parent).
Existing MFD drivers sometimes follow this pattern but that's wrong.
They follow the ugly or even crappy pattern.

Your codec driver still refers to parent and it has its resources,
e.g. parent's device node pointer.

Best regards,
Krzysztof
