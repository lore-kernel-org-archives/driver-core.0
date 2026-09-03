Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB84B26B0A9
	for <driver-core@lists.linux.dev>; Thu,  3 Sep 2026 08:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422734; cv=pass; b=bQmt12FQ6Bi2ZYCiQaXA/78vq5Sx28jnyJqhkLQwOFMU8pQHhYQKDE09ON5v16yFZcZZh3cbqo+yFCqTK1wk3Z/MAODqJpnCo1u8TMI3XsCJ7csz9DZZ8CT+3Whqo25R1IbckBZG7lcvIY1/zedvmFxMzJzVn4BaQ0HJF5K6XTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422734; c=relaxed/simple;
	bh=fovmEqIqgVXpo5nek+CJqatjdeLkHXnTUt8Ymo9s1zI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQV2NBxnhlpXdlAUgbkNidWDadgIzM0r21rkupoNwzWwOrL2UgZ/ualpk65tAVyR29o4RQb3AAfOP7iqD9VI6fbqT1uc1i0Nw4dWPcRm4AHHpRl20pMh4GqlZ1IHAbMDL68YSV6l2/7vUiAkLYXiOTcwauyppgSzcIECDDR19n8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7k9/uKC; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7k9/uKC"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso2893332a12.0
        for <driver-core@lists.linux.dev>; Thu, 03 Sep 2026 01:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788422731; cv=none;
        d=google.com; s=arc-20260327;
        b=s2h9Ujx8M3qh0s9+wOfKOHlEUKxoF/rGrFdaNwDshj0aqedmI5yGZRYg9UhQt7ozQg
         g2fcpxoFKkaIMR79VOfpVWnZZCMrW9KRe0KENjBAj16/sDG7FAFFY6hcvATMe5fRD8JW
         wUP+TKLQDx/1A5iw8Aa5e+YwiIb1q4fefnQUlsmuz5/Y/7QMOVMNtAFa8HXJpWKZ2L/r
         RU8+JYgGtBoLvPbY9QifhG+i+t6mDFIOLoq4AelrCXyarPSFcOxTX/8EJPmscY0z7et7
         aLkxMDT2MXzJcMWA3TDjKb+to1SBZVIr8B/JZpOr+OgnixtqAzv2Ii2U/rvLJBfOrmn2
         L7IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6SrVKYP6RqUW7pG//37NoHw2yaQK1BSwRv3M9s2+zc4=;
        fh=rjNlBzL2pdHzmqJloldHyB11mIwCZCAGdUK7BZI0W4c=;
        b=Q5o03xtZrxyUwQQoCMywLxK7rE+wKHB18A35Yq2ByjLHQ8DHTCEQ1Jwq6sJ0UR5dhD
         KBlBz+7WkYjZnGmMSgkfVQHyDuj3CUsVl2NhKFOpKiHxdOenza6UQUOkPO4U+9rRnLv8
         OYTgZ+XSv5I+RuPHS0L7KSZNVSeB8RfY5tHpme9uOTd7c09U7Yt/vYL5lxinBrFJHxZB
         NOzAyZybOFaaraZymn0bG0j7+UQUoUDmCFgJW9sQynekr+zvr9fyNYKtvwkp+47XC922
         5EbPopVP+co076a/CBE8jH7aUG2ZZl7llzog3mzE3fMNWQu7GaBwdv9HlsTdNhQL3hP5
         ChIA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422731; x=1789027531; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SrVKYP6RqUW7pG//37NoHw2yaQK1BSwRv3M9s2+zc4=;
        b=D7k9/uKCBUSWZRXXZMcOBJZhpD8Tp22o6uBE0HpfegWa4RiwPibvge1jzfnRG2OEwf
         InDqG5dvMUTC/iacr7B21ben2f64sFrtiU/OrounzZjgccC+95xPc8lAjd6FG7t5ISed
         IT32jg4Ik5d8qz9yoTM5hJcVgs4DUGtvJ/3XypNlpbk82BKK7W/2TtrZObiy9FVApiWB
         3yY8x4uBEclXCymxmCxwxW7lo4ZR2IOqCNh4ghAokDH8SsM5mzV665xGLfXUZrzn0XIp
         sZ95JkTANu4WMe+T/5XqCFIeMjLUUY5R0TajRO1tSCmGCA82o2qcr3/hnCpGRkqomB5Y
         ymrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422731; x=1789027531;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6SrVKYP6RqUW7pG//37NoHw2yaQK1BSwRv3M9s2+zc4=;
        b=A1jNbIE3OvXr+J/6V57qTRWofhuryyZuZpRnoIk83dYcAvbeBqvOvMZq7NQuWB75J9
         jvyNhxevxh53TE72jgC5Um4vF+0nzvnU9S4bc2SQWE8rDYR6rZeR2EFNqOWJibXSu77+
         dgxu4XyVAoeII+dRXqMI4p1Wr50taaKPwKyLpxLE7x0fi1myOhzHdD8Gn98rAFR3ZJg6
         EU4PIIky1Wun/oQ6exqY4J4ghbxmepJktifcBRCgK+CWhANcnkw6io+qHxZ44sdBYcz1
         SMTsWw+0O79zySN2DC2oqbj9Pi5KobmIz1TFpgzyF1KIX40jIhmFCaq87u+yFPvJ9uwk
         nZQA==
X-Forwarded-Encrypted: i=1; AKwUvBxMiE6UxXDpaE/cN9EGubVJpuv5bjpiRsG9u1Tyng6zU0fT6xO5v80Xe5BOL+NqjXlAIQH+q+9Q42gM8Q==@lists.linux.dev
X-Gm-Message-State: AFuF++kcaSFXwglcrGjred8mJ6AIPeRMXdMuTv3zaAv/KSXDmNDdYhmg
	QpqynVCwKAL8/f7gm7kUBb3azSECP1xs/CkTq79a58NhK6l+37s8zauSL2XcBa3d6b+rdM30yjy
	1akpdtDgf1jAhC8F3sWjFblBBwlqiekk=
X-Gm-Gg: AYBFou2TTT/+HHMZf9c9Ji6vzURgaltCYj7s6ui1rw+pMy3r0CccgedtgU/E6j0tE3u
	Eux1oRFWYxKHNHJpUev+Mw/D88POrjR333ibt6h4+2BWei5Cw7GV1l7h8E/6NE6DlFzOURfrHZw
	CzQPU4RbgB89Sx8fhpdgcJqZesgtDIyMK/V8YlC/Z7TbLHm8NFh5YT/5P/UrhBda2xwPTWftiRK
	opUhhAXlELFiAArc5YIFn7ouG6YiEWy9bknDmkK0+ehuJYIGTEv0xjthaNKfedY4bmrBH/KL1E8
	7ZpvMox2wOVU68qrgOZh0o1fJ2HvZ5f8+1ktYmcQJR0IF8IjP5Haqt2g
X-Received: by 2002:a05:6402:2110:b0:6a3:87b7:b5a9 with SMTP id
 4fb4d7f45d1cf-6a682ab9d91mr6190594a12.12.1788422731087; Thu, 03 Sep 2026
 01:05:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2026082042-coma-moody-5b4e@gregkh> <20260820084557.129908-1-khiemtranzo532001@gmail.com>
 <DKTWKZFYC6TL.2ZESRE0NWAV2T@kernel.org> <0198b9fe-4bc0-4e12-b788-85aa2c9f8162@rowland.harvard.edu>
 <DKU2J83B6IX6.2CG1WOB66WC39@kernel.org> <CAEe5be5OjseCMxGQP=QMd1L-muOTDguaay_-21moS1+xRNNNyw@mail.gmail.com>
 <DKZ6PZV65PYX.3M9UEZC4ZMLLC@kernel.org>
In-Reply-To: <DKZ6PZV65PYX.3M9UEZC4ZMLLC@kernel.org>
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Date: Thu, 3 Sep 2026 15:05:19 +0700
X-Gm-Features: AcwNN1WMKVWa1WK1FArX1_9QFOqs2KtBbQ6O2kt-cOvVQdr4bwbcIwMEhE1l-hw
Message-ID: <CAEe5be4cJ5VPu88V4L7i0Pz+joSmJjBOpA=S9knbk44_-Rf9Og@mail.gmail.com>
Subject: Re: [PATCH v4] driver core: avoid klist_remove() on unattached knode_driver
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, gregkh@linuxfoundation.org, 
	rafael@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com, stable@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 26, 2026 at 09:14:00PM +0000, Danilo Krummrich wrote:
  > So, for a fix that also goes into stable trees what you propose sounds
  > reasonable, but eventually we should use the match() infrastructure instead.

  I've implemented the approach you described:

    - In usb_driver_claim_interface(), when !device_is_registered(dev),
      skip setting dev->driver. Instead set two new fields on struct
      usb_interface: claimed:1 and claimed_driver.

    - In usb_set_configuration(), after device_add() succeeds, check
      intf->claimed and call device_bind_driver() explicitly. This skips
      ->probe() and attaches knode_driver to the driver's
      klist, making teardown safe.

    - The __device_attach() dev->driver path in dd.c is left untouched
      for w1 / ccwgroup / pata_parport.

  syzbot confirmed the fix; the reproducer no longer triggers:

    Tested-by: syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
    Patch:      https://syzkaller.appspot.com/x/patch.diff?x=12af8b49580000
    Dashboard:  https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d

  Will send v5 shortly with the syzbot Tested-by added and the subject
  retitled to "usb: core: ..." since the change is scoped to USB only.

  Could I get a Reviewed-by from you?

  Thanks,
  Kiennql
