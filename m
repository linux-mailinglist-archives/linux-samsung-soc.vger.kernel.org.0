Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37B45577E8C
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 18 Jul 2022 11:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233754AbiGRJYl (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 18 Jul 2022 05:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233644AbiGRJYT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 18 Jul 2022 05:24:19 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F2716384
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Jul 2022 02:24:18 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id f65so10009107pgc.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Jul 2022 02:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=DBXVr+2yQA4Yc+mJwCPapHs1PcqJSd/+SbzdjhsE7eQ=;
        b=MSsTVbFkaO1i0b6iYF4wSYh06F2HTXmGIXPyHrILtQ2s6jMBXG1Yn+aEJfK2iRAJT6
         NmrNd4xd0gFLMUEDQBve40T+9E+hlRxZ6zjJ0cfLZOMJ+ZoYae/2TJgcSK40DQ/79I+x
         CXsCT3LngwqyL8AGRr3k8Z5MK6kqW+o2646ZUdvtdeLSiQBCV4S0xE22Nd8wxeqa/lh4
         HQf4RfXSCmaJPAX+jcqvLUo30V58vCNMmFGUOzGT0MBYY3XD6dKZUBjH6vxqmJt5z2oA
         b70zS2ejVI1g6bm/bo1wXIEPB7aWMfYSp0nKSwol+y8sMj0XjDBWB1PGiSJeF1+esdhT
         Ri5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=DBXVr+2yQA4Yc+mJwCPapHs1PcqJSd/+SbzdjhsE7eQ=;
        b=YyO31GSSurGF+pCCvuJu4TxRDZ8zHyG1ONM7MXnWrVDGHWyf2sUifOzDoTrtk9FIcW
         a7H9FKz7LT8zcRrnYo0bBZ0RNHwMytoYWluViTDjl6BKLQsGhJVbsqTK03OaGGvBPQCu
         aKJssLtp176nV9lDa0YIp6YAsEXG0GeI27s3CMN6N7UEVto5eATIwLTocwJn1uXK/6gb
         BKxDM7E1dPcdN9Yv57pOcbHZDKq6T7z3tzaFHJXJpGW8eaAgNXBO1kcSbSU/3OI5n28p
         Pj2sajpNvKXTLYP/RDpqXL5/l7CChETPT4B6CLP9wsbm+EmBtupE2JbUt9XeIEmctHya
         vbOw==
X-Gm-Message-State: AJIora/c2iRsLgoAWtqFe10jFScppkapkSIxUAOR8zuLyOzN2n5l6Btl
        ugVk+/AhRUQhtDcCXRCMpuo9wimHf/Km4OvjxWc=
X-Google-Smtp-Source: AGRyM1vnYYwVzPkudbVH1tEcqvnh2Lnbp1XBf/6zkLu5nBLzLG5OKW3Gi9FuMu26BDF/Rwpo2XrcHo7DNKRVdHg7SfU=
X-Received: by 2002:a63:500c:0:b0:412:a56c:9ac with SMTP id
 e12-20020a63500c000000b00412a56c09acmr24499527pgb.158.1658136257640; Mon, 18
 Jul 2022 02:24:17 -0700 (PDT)
MIME-Version: 1.0
Sender: chrisdicksonchris@gmail.com
Received: by 2002:a05:6a10:cea7:b0:2b8:f444:258a with HTTP; Mon, 18 Jul 2022
 02:24:17 -0700 (PDT)
From:   Chevronoil Corporation <corporationchevronoil@gmail.com>
Date:   Mon, 18 Jul 2022 10:24:17 +0100
X-Google-Sender-Auth: RiYy3Tz5WvLzlsewENpWwW36SXQ
Message-ID: <CAKhAfvg=zeDCymzh7Eeo9P2okCA4GW8Ys=GehJ+gDJN9scz9Xw@mail.gmail.com>
Subject: UPDATE ME IF INTERESTED
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

BEWARE, Real company doesn't ask for money, Chevron Oil and Gas United
States is employing now free flight ticket, if you are interested
reply with your Resume/CV.

Regards,
Mr Jack McDonald.
Chevron Corporation United USA.
