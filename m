Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69D0F6ECB6
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 20 Jul 2019 01:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732701AbfGSX0a (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 19 Jul 2019 19:26:30 -0400
Received: from mx1.riseup.net ([198.252.153.129]:44860 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728909AbfGSX0a (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 19 Jul 2019 19:26:30 -0400
Received: from capuchin.riseup.net (capuchin-pn.riseup.net [10.0.1.176])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "*.riseup.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (verified OK))
        by mx1.riseup.net (Postfix) with ESMTPS id 7F5E71A0E0A;
        Fri, 19 Jul 2019 16:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1563578789; bh=aDG2VGd0jkmU/0W2jMHMu3CovOrpL0bcc6Kn+rrO28E=;
        h=To:From:Subject:Cc:Date:From;
        b=LwJyLa8ck2KRhrAL+qDINbktN4Whjeg/KdTFDzEfWDcV4dHE+J+QnNr94Eun3Vn6S
         t2uFX0nm/7SYfIN3S738BuezFxeSgsOBPAbRCU8X1FFOzmjf9rORgWAIPykiVgVF1p
         ZS3ctO6Q8fhYIUFSlnxJDZ3lLXesfSJl3qIvCZqA=
X-Riseup-User-ID: C5FF39F5AF09B19B6B005E179456672F6E938DDBADDD907208415063E494166D
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by capuchin.riseup.net (Postfix) with ESMTPSA id 72D751203CB;
        Fri, 19 Jul 2019 16:26:28 -0700 (PDT)
To:     linux-samsung-soc@vger.kernel.org
From:   dllud <dllud@riseup.net>
Subject: [RFC] devfreq: drm overlay planes glitch on Exynos 4412 with devfreq
 enabled
Openpgp: preference=signencrypt
Autocrypt: addr=dllud@riseup.net; prefer-encrypt=mutual; keydata=
 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
 ZQ8HKQs4RmPOBIk=
Cc:     =?UTF-8?Q?Joonas_Kylm=c3=a4l=c3=a4?= <joonas.kylmala@iki.fi>,
        Grim Kriegor <grimkriegor@krutt.org>, m.szyprowski@samsung.com
Message-ID: <bb455b1e-9e3f-f1b1-4164-fa1dfca5717c@riseup.net>
Date:   Sat, 20 Jul 2019 00:26:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

As advised by mszyprow on IRC, I am coming here to report a graphics
corruption issue that happens on the Exynos 4412 SoC whenever we use
devfreq in conjunction with drm overlay planes (DRM_PLANE_TYPE_OVERLAY).

We are working on a fork of LineageOS 16 (based on AOSP 9) that uses
drm_hwcomposer attached to an exynos card0 node. Whenever we enabled
overlay planes we would get the graphics corruptions that can be seen at
https://gitlab.freedesktop.org/drm-hwcomposer/drm-hwcomposer/issues/24

With the help of ahajda on #linux-exynos the root cause of this issue
was traced into devfreq. devfreq was enabled on our 5.2 kernel branch as
follows:
CONFIG_PM_DEVFREQ=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=y
CONFIG_DEVFREQ_GOV_POWERSAVE=y
CONFIG_DEVFREQ_GOV_USERSPACE=y
CONFIG_ARM_EXYNOS_BUS_DEVFREQ=y
CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=y

Removing these configs (i.e. disabling devfreq) got rid of all
corruption issues.

ahajda provided a tentative explanation for this:
> There are multiple issues with devfreq and clocks, devfreq too
> aggresively lowers display clock frequencies, as a result DMA
> transfers of overlays are too slow and result in screen corruption

We are reporting here in case someone can take this task, as we lack the
skill and knowledge to fix it ourselves. We were informed on IRC that
the fix could take the form of a patch similar to what mszyprow did for
the mixer/hdmi path ( https://patchwork.kernel.org/patch/10861757/ ) but
this time targeting the fimd/lcd panel path.

If needed we can gather more information and provide all assistance you
need for testing. Some logs are already available at
https://gitlab.freedesktop.org/drm-hwcomposer/drm-hwcomposer/issues/24
The relevant IRC discussion is archived at
https://freenode.irclog.whitequark.org/linux-exynos/2019-07-18

Regards,
David
