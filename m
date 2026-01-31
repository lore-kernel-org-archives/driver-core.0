Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658DB288C2B
	for <driver-core@lists.linux.dev>; Sat, 31 Jan 2026 05:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769837791; cv=pass; b=PM0aolHPFOP3FcSdO1KdBqD+ukny1WzV6cuveaDjl7gBjB0XOua3/61f20WfSnT0d9OY0edBg1wrUla8gDjH1RaLyj3ZJpX7rcwYZxPe+fPT++VrBdREdy2fnEnFPq+sYLbmKmLYtdmFIf2Q9EwGJioZf3Yinj1sJsQ4J7E7Bbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769837791; c=relaxed/simple;
	bh=L5lCCJeawGC9hJJCA5fbpN5uW+ZSANYkxwSHzQ8MpGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uXdLTfoFWZO5JmEN0cJtkUj1GDkZWcB2Aoj9naeIoWkXot7QBJNHus9tiLcuhu5Z21i+Ale5q8kBYXQEOGyH5QlvS4+JDfuXPq0AALkmchNGFh5nI1DzYLSgoBwbr0v6/Ph2uYZDQYGogC04TFffbMpQnntwGzjbKN+F/p4xVaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5d2Npkk; arc=pass smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5d2Npkk"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d19d3c7208so1503877a34.0
        for <driver-core@lists.linux.dev>; Fri, 30 Jan 2026 21:36:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769837789; cv=none;
        d=google.com; s=arc-20240605;
        b=SaRuZ9gCzgsYd0/AQmjm4qgQEQ5sMIB8YxXT6ZewwJuziTrn01DuGGk2yuVpT2DZYG
         oIRDo8TMdrjEnqLylHQuBAsnsn3oDz85SVrZLJjbbq80tOu/4sZ7SyY66lDmz9q+0OEV
         ohPtN3QalYnQJjg3licFcbb/SycRAwFf9JbUa5ymUArpPeC9yoA5wR/GRK3BRYIovxRL
         7a23jo8/CJ9i+QuFUK9UP3DNJy/thRilpJSsRJvCFZZb6blbtoUMB0BQISYP2ZnLuJD+
         +skgpQzrMFiwHXprlyFGdBG9uAsJBp8vctuwL0RocKW2WuA/aZMYri784cEqdLo0hKPq
         7heA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L5lCCJeawGC9hJJCA5fbpN5uW+ZSANYkxwSHzQ8MpGI=;
        fh=chqeh8EYGiXE1pa2t1jiNVKnbGCfwvZM1MVoCFFK7+k=;
        b=WSIs1lsrDUt/OKScwjjb9ZjCuo71MUOJYsRtGkwXsBBdU3t1a6xhmZgjLJngGFDLM8
         Q/kt3U4YMII8Z4o5BHoBxe6V5wpSBj9vaog2neFMiW7y1TdKHbAr62X91PQ7AcYp7P0q
         sV+mPuHQZWTqsPA0oz2FwpISzfJPBqfxIIwkzzvhVu7BRmvE5Kq9DjiCNrPhbzj8uIKl
         BmEQIOUPzt0+ffrjAhy3xp80Z1VV7E2AzB4LSJnmjluC6Wu8tH3jWrGSDo6ynx2/jWEk
         GfE8NkhL051qPzneqV4+fS07A9FyHQCQawBOeCK1Rx3GuvmvZXIkMvlcIWtTLGxMaRnC
         ZdKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769837789; x=1770442589; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5lCCJeawGC9hJJCA5fbpN5uW+ZSANYkxwSHzQ8MpGI=;
        b=T5d2Npkkho6vESRgsUUY/h8DgcH52rpBmmExGEfyIKT7zLSoSyiAL57pxKMAiH8UYu
         ZAeBQ9c2YIuFW/p4+pkvA4EDJ1mCERkXgT5GBKTZ1yjpDBF844bZ9DsEGwv9jcQnFBrG
         r1+JRyI8TriT94ClGsf+BbXa2nkwC8a/g7t1NnFhuN4rgyhpSyURRsM2/5Imw6f5cChP
         VCN7TuuJ6JRQT7/bj2eZVXCYFxHvee1b6gtw2QTGKgvp5wlVagNoVOiv58+hItSXK5KI
         SbmgvJsZAWXnQLuctgzx5nQsORsKbn6beY9/ZAHWQi77ILq7ldGaEUDKfbDdzlj/n5Sm
         +UfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769837789; x=1770442589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L5lCCJeawGC9hJJCA5fbpN5uW+ZSANYkxwSHzQ8MpGI=;
        b=hSF5Oj2/3005Ln58tZk0VVR/Es9bojjkP1fOpRWyEdFHXxs4tas5CR84spQZ6sTxCl
         BtSxJ1+LYr0hlHKD3g0xlHvnzVlphBLnW1piP8ZWYBojoi4vtXUpDEVyqMzCyBEKsQee
         1K3SL3oVgzAOZZTPXURFTvB1evlfzXhISHb5DjXYyBFCrL+fJquShOYUWhhuYRoxoRXt
         RhUmkgn8upmA7u+YR7lAwjaxr/WSgqkhMcEPZOEvXya8UpeibH4xyJRc9kMRdkfwPOw0
         KRZ7M1AHcut8HHtGbt4hk826+/zg7k7MBkZuP+YexevyQretX0aV+c71kJ461EDSp7zF
         kFcA==
X-Forwarded-Encrypted: i=1; AJvYcCVh29nx/vE31X+u081xRSw6y1q9ZwRTm3qMV34bazBVsjILnyxeooCh78MR9+5xxVcSXSk/rqnBPtVC/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJGUB0bE9B69GlCY3U1WQ5AN0e7EV7JtDFla75bUeys3rlBKG6
	JefhLbeggWZwO92FtZndgTkQoKCFJq67lTZWdXjaLqVNe4yv0QwrJSoddlZscEcr181XNy+zv9k
	NqOr0OFNY6jlU2UhXs3Ejbz+bwVZV1z0=
X-Gm-Gg: AZuq6aIeo0ngbzm1t6iFSp6yutSzBKteNjNx7l0KGPNjTugLeZIcqFxhtQnAgVXJHrl
	41q+Fkwe9zRfVd0N9e5d1U3UIVguj1RFVKO9aRpDq765LdYAkdMK6xGCaxdfRc1ZiPMugjZvD1z
	ZohQ2l/Z0HLUWq2c1A4U2QGgoSFqvZPObnNJpdKUvdtdhjo0+dNDJuOex2bho5PN6U/x8yl3P62
	TWL1z9EI9wqSjJCUHwSFZW34m2CUW93UwYq3kY6ZeiWzVR02sw+V6jEB/mzImnfi2mwG8zn6xX6
	fJoSGKXvHpODie668PxBDxdPWfpVsRSOQ4kfbg4jaEfE4GBH5uUSeUq9kNSaq9xt3Q0RbQ==
X-Received: by 2002:a05:6830:6add:b0:7cf:e539:dcf0 with SMTP id
 46e09a7af769-7d1a52974b0mr3607758a34.10.1769837788987; Fri, 30 Jan 2026
 21:36:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260131014211.12841-1-dakr@kernel.org>
In-Reply-To: <20260131014211.12841-1-dakr@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Sat, 31 Jan 2026 13:36:18 +0800
X-Gm-Features: AZwV_QhVaYryFhMMxbjOpEYEHkLqFrY_eyNp51JLbJAmjU0TreB3QjSreMSuAPw
Message-ID: <CALbr=La5dzZL5EP_x8tcvUWTqfbxPS6T3ZGT520m0Um2voUt=g@mail.gmail.com>
Subject: Re: [PATCH] driver core: fix inverted "locked" suffix of driver_match_device()
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 31, 2026 at 9:46=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> In the current implementation driver_match_device() expects the device
> lock to be held, while driver_match_device_locked() acquires the device
> lock.
>
> By convention it should be the other way around, hence swap the name of
> both functions.
>
> Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_d=
evice()")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Looks good to me. Thanks for fixing the naming convention.

Reviewed-by: Gui-Dong Han <hanguidong02@gmail.com>
