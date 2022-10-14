Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE3035FEF9A
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 14 Oct 2022 16:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbiJNODO (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 14 Oct 2022 10:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbiJNOCu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Oct 2022 10:02:50 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8704E73C10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Oct 2022 07:02:06 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 126so5709760ybw.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Oct 2022 07:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=EyqysdEcZyeNHGETROpG+eqDge9fV207SQKcnr92C9RKgTA8rzTHHxx2fDcblu00It
         PgkvoDxRC0LZAPWvmZFuZlgTo+9exb66DhETSBkYIJmvUP5eJfndyS+bJFSYKHaXNumt
         AUp1w5Qfnkfe6GU1+AblhNpC5JExAnIDuI+mPK/flMn/zcUxLCle9ddgWCjTWTBm1pm4
         F0FtnNlbwPDkQr3a6EkmdJIxSkNb4RGo39LU9OXuvTm9sF/gTuxgmDPdmhSVzHEZv/AD
         LB6CwFqFywfYSAqUD/wEHWXf10IP7ylwLuAHEMlqsQiL3w4iMwIaxeBo4/3QBpzqGGi4
         XX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=PXIXJ6NR7pwIjd+XOmmvU/4G26K4RC0KqfYCVru6f3R9z8e0iz60Pd5XTQ3mZ672kT
         OhOnWyocV8h82amQcPXDZ4WtvV/6V3MMR1gLH/nnnwRyBebhiQVcDVHYLMMDAypEG63a
         hakNiCbRrSUgenrOulahU1sss7UPq386n+2AESGhGq9t2dBj5bRdg0/5b6QT7Voa3Y7V
         7W+bfmIcKMMWu9whc8QL6iZhmcZQU3STa/U98TIl4l4kn+zcZf97OTjJ5DY7qCNUOFAV
         gKWk8zowxe9lZ01AWCdMBJOA/mWQxqQYay3YaIcGYj4LJhVThpx7WuPBRZqwXz20AJpz
         ZlwQ==
X-Gm-Message-State: ACrzQf3ooiCdkBza/giJlBS+9KYhwjpHN5mqZdnGX5J2ZbFpJRVUCEot
        we/OR1dHQ1BtNKHRZHOa1S4P5aZCah8zfCTKK7o=
X-Google-Smtp-Source: AMsMyM4Z61VzO5fZEDkt1768LPsaLrxvuyztWToPwpp2LIebc48voQrAd+dostKHVEkWHatFogpVFAjmVQpHVezDy/s=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr4690987ybe.642.1665756088067; Fri, 14
 Oct 2022 07:01:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:6c05:b0:3c1:5961:57b5 with HTTP; Fri, 14 Oct 2022
 07:01:27 -0700 (PDT)
Reply-To: tatianaarthur72@gmail.com
From:   "Mrs.Tatiana Arthur" <goowjarwq@gmail.com>
Date:   Fri, 14 Oct 2022 16:01:27 +0200
Message-ID: <CAC-x_XGPhaAFvtwSsv_dWvZJJHFhYhsKKzpxCm=_1oo_v5vL+Q@mail.gmail.com>
Subject: Did you receive the email I sent you?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


