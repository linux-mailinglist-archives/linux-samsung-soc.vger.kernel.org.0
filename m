Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2111748E06C
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 13 Jan 2022 23:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238028AbiAMWi4 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 13 Jan 2022 17:38:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237996AbiAMWiz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 13 Jan 2022 17:38:55 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0662C06161C
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 14:38:55 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id h23so1158336pgk.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 14:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=YbEI3Q/NEjCtDTVCV1jkA7nYNYBH/Wfa2wk3IkVyJko=;
        b=TZSnmiKfh8lQHyoHB+yllzvEmA18to6wFnOGKYs0poMgePC/IzPQirrR4ktwaDnvqN
         6MtgeXCy1yK/vlfiGBEgBcEWSdlaZhy13ZGg8bropI5LiWLT69uDg3RLIG4RAEnMei/e
         OLsKu4ckBojbKLqXja5eQdc78QuplSbLUeUuR4YwQsmoJKPsmqAxP6kAsKKrhO2uloGx
         jgBW3DLRyjuJTQuba5a1bywPT+79uteTY7MRR7+lTs5pNJAoJHK8njIEoPRz5bJHtGc4
         HFHciKQwdRnv9OQdv5RacscrcPdsiz56D1dXGcQrq4Bp8NviqIrfWkgUqnbc+T36lHWO
         JWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=YbEI3Q/NEjCtDTVCV1jkA7nYNYBH/Wfa2wk3IkVyJko=;
        b=77APKoh460vjRSNpa6SxlaoVNQh9dYU7b92G77u9dqno/ZlFkdBzTQmtmRaLSePHtl
         zoWFnmq1JOdaRx+t+xdnDc1UErfJGvspLm+8IUbOHgLsIjT4eZZOjwsM7pi4Zo8BAyQf
         vEaD+Gc2zmZFJDWpM/fiX7GrXjS89qs6LyIqLfEMRIcYQaqokhzYHjriL3DYlbvCu8jH
         2QD7ZebRQ586H1eG2cuoeFeThepmBWGyJQNsj19xYv6oYeV/OQ287ycQCO4p8aa0d88i
         3WDTpPl/wmPoxJR6yjw/uQxWD00jsA95SWatHojxSj7gQR0/tuWexvby9jKfMkGI+e54
         mglA==
X-Gm-Message-State: AOAM533bIgACWfXscPnNte0inUsp+cnSIRuCAYPhv0NNBJiDOivC3z0C
        bkYhPptOie0poFT6hlpXpsIOTDUNUMcrwtnqiA8=
X-Google-Smtp-Source: ABdhPJxV+CDcXMAaoBlObNCE+WkBdJZDSsiMXXJxSU4qLOl+5GP7wjtV5hGVQqePL03Cw94D/ZrqizECvr4TNYXN3v8=
X-Received: by 2002:a05:6a00:26c5:b0:4bd:4ad6:9c71 with SMTP id
 p5-20020a056a0026c500b004bd4ad69c71mr6167765pfw.45.1642113535225; Thu, 13 Jan
 2022 14:38:55 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:f38c:0:0:0:0 with HTTP; Thu, 13 Jan 2022 14:38:54
 -0800 (PST)
Reply-To: mchristophdaniel@gmail.com
From:   Marcus Galois <marcus.galois@gmail.com>
Date:   Thu, 13 Jan 2022 23:38:54 +0100
Message-ID: <CANqBaXWLwHBNoawbz2tGySxar8jn5q2OzEiG-GjWCyVh=aJu6w@mail.gmail.com>
Subject: Good News Finally.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hello friend.

You might find it so difficult to remember me, though it is indeed a
very long time, I am much delighted to contact you again after a long
period of time, I remember you despite circumstances that made things
not worked out as we projected then. I want to inform you that the
transaction we're doing together then finally worked out and I decided
to contact you and to let you know because of your tremendous effort
to make things work out then.

Meanwhile I must inform you that I'm presently in Caribbean Island for
numerous business negotiation with some partners. with my sincere
heart i have decided to compensate you with USD$900,000 for your
dedication then on our transaction, you tried so much that period and
I appreciated your effort. I wrote a cheque/check on your name, as
soon as you receive it, you let me know.

Contact my secretary now on his email: mchristophdaniel@gmail.com
Name: Mr. Christoph Daniel

You are to forward to him your Name........ Address.......,Phone
number......for shipment/dispatch of the cheque/Check to you

Regards,
Mr. Marcus Galois
