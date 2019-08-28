Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9649FA01F4
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 28 Aug 2019 14:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbfH1MiQ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 28 Aug 2019 08:38:16 -0400
Received: from mail-io1-f42.google.com ([209.85.166.42]:45720 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbfH1MiP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 08:38:15 -0400
Received: by mail-io1-f42.google.com with SMTP id t3so5404775ioj.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Aug 2019 05:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z9ub6dj8BakJd5JJrKLeLyNZnt+cLi7XQzPxfXn1B/Y=;
        b=ol+VAJf+uEe+pW+OLeIh97TD4/T+F5ti0j1SOXt8p3g3+9AxRgrzHA2mKJ5vaZU8VN
         Mtw2wgGYnnDXzVmxqToGtF2nfMvHrJsaRTKUm6NFeBvnBEL/AE1VgB2U4A+TnFgGlFJv
         N3OutN+gjpK3Rrv6OQryvih8Y47Q1kTDwWl9GUwd8SvcwKziaGAnwe7nyHPNsvpwQUma
         IX11hff05i2Q3HWy3nNHliuIoVJgJZC4rPy7abvo469srBQp9xh3rCEfMD2lAM1jknIq
         8/zI0DqvJJeFJiUb98QaHvF8wwP/1clSTYqlKYm6UCHQpY3oSvVrXFAXBEEbPpXvHWuI
         boiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z9ub6dj8BakJd5JJrKLeLyNZnt+cLi7XQzPxfXn1B/Y=;
        b=BveZC27GCeu2jozaUvyw/0Nl8rwRVY8X64lGWoV2agA+0c6qWMBA7SEPNU3pzumd17
         ANcqpPU/r+DUdI6U8tkSUUaH7urYt2kwtue/YJzHvcmQpxYaV6jFo+D6I+zSVrjpeu+r
         F7nDwC61kCQA9aVJM/5PqKVSN4o5e+nb57in0AXDuZyEj9bynveCYrjg3/FHrWVFg+Wy
         qvzs3GH+cqHie2yQWC+bfDTSiPHSmp+TPCqhBno73vdw05qku2c+Iis36FNIHmrGAjg3
         sE+2a8YJDf2UV8Z6NR3NaZNPgbG2gMx/+dYnrzZF+iv8tG+QaMzHahbtiYQOyY+2rNm5
         ypeg==
X-Gm-Message-State: APjAAAVEDOid04P8kXVZbGA5GZwx+mK7EMeGtqgWEzE67PGqGiuPAbRv
        LaSNXOy/DaeByu/nrUUwmXgbMsTTxyS1jQ7lyL2D6w==
X-Google-Smtp-Source: APXvYqxbmqQHdWluIFStqQGMBY9/BhbwVz+UeYCfBFj2T06LLlJsyfJiSeDsrC/N2EuGpd3vnE0wVob9VErTw280+4w=
X-Received: by 2002:a02:3446:: with SMTP id z6mr4201108jaz.105.1566995894846;
 Wed, 28 Aug 2019 05:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com> <CGME20190814104630epcas3p44755443f37e78b2613f7dda35d71bb71@epcas3p4.samsung.com>
 <20190814104520.6001-10-darekm@google.com> <6bbfb6f8-15c2-9ad2-8857-898f4c6435a3@samsung.com>
In-Reply-To: <6bbfb6f8-15c2-9ad2-8857-898f4c6435a3@samsung.com>
From:   Dariusz Marcinkiewicz <darekm@google.com>
Date:   Wed, 28 Aug 2019 14:38:02 +0200
Message-ID: <CALFZZQHZrVSaKhTSH6suOc0epMQzcgxAHddoJGxvtdhSp1tW0Q@mail.gmail.com>
Subject: Re: [PATCH v7 9/9] drm: exynos: exynos_hdmi: use cec_notifier_conn_(un)register
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi.

On Wed, Aug 28, 2019 at 10:39 AM Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
>
> nit: I think err_rpm_disable or err_pm_runtime_disable could be better
>      label names.
>
Submitted v7.1 which replaces err_runtime_disable with err_rpm_disable.

Thank you.
