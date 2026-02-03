Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798AE17DFE7
	for <driver-core@lists.linux.dev>; Tue,  3 Feb 2026 00:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770077939; cv=none; b=KDWqxu5fYRvV67XyjQKDeOUeaGXmso5zxf+WYyIZ9W2c5lub8yinDlGnZJd1lGirm+2TOVKtPzYDPJwr4TZ+gj8kM+H4o5g07S4gkxLQ55GkMtHSSvrxwHlf7o0EWeZhoHPf7OWmDGNLJXVaoaceG/E3pulXAHQR0bdm1zQdrJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770077939; c=relaxed/simple;
	bh=kvFBZrL6mjnoA0d4J5XigmhYX+FRf8/EkWVJ6Im6XWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MMd3+zJaPb1H1uD5wi6yA/hKAyBRfvNGO+RiRs7lWxJwFnZKdo1AFdUXXFVBWwwvPFhOm3Xui5/Onv5slB5TaWiywyUHqIEyT+UY5Y9Mqhf5H72MdGVw/TojFDhJ1OkVmu873lcpJrrFI6IfQssuj9nv8zqQPARlQPKc8N3/pJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ttD5xsaJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttD5xsaJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F10DC2BC9E
	for <driver-core@lists.linux.dev>; Tue,  3 Feb 2026 00:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770077939;
	bh=kvFBZrL6mjnoA0d4J5XigmhYX+FRf8/EkWVJ6Im6XWo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ttD5xsaJs0J3WzIH+zZ+7i8C+Hd2hXp6KOCVgBZdLRwG/OWsLetP60ZwFIJ3O8hJZ
	 XBhOZJadsTWDw36aX8PuAQsM7qBrMz5l/WYAIxw3rGw4c0jE96YEXrmEPWUNmmIHaM
	 nDxJVLqZ4FFo8wv2tvNBY0mCFzXuoPZTMn8LzzgxOCykKbQL//2ZWQc861YOS/Rs/s
	 llxzo6q/eIbgxBXuJXtkDVm/OGKlfaIgWHHSJoyT3DTy/7yz7UuYTN4bCWZX9ypq+x
	 PR4VhAPdd3+O6DeH+1FCFibS6wazeSCvKDCJNWmtaG1XSPsxfPjzc0DMLnNhFpL2ix
	 5MADNKoBxsdzg==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-794d58b892cso14530827b3.2
        for <driver-core@lists.linux.dev>; Mon, 02 Feb 2026 16:18:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUywsDzrZZ7W+mRSbF7FGfqE+27iyNYc+a26wHMjS2CufY+YrtGheaDa7F2L6CpsEhQx4hAcOTQrKcEng==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGiU1lFnpQpbgNjp4se2MZh/u/IwFcuuHA7NiYoWIVbVXyStCj
	wONh7BSuBAaO4fjtooZMGFK/d6ta8CLKL/beBHZ59Jf9EdeBqrhHmchf5jzr+TnRA3NdK6ievXm
	3WqSi0GaPYa5iFYklIMDdTxtNLtCI7dU=
X-Received: by 2002:a05:690e:138f:b0:649:b31e:8f5b with SMTP id
 956f58d0204a3-649b31e912cmr7549452d50.4.1770077938461; Mon, 02 Feb 2026
 16:18:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 01:18:47 +0100
X-Gmail-Original-Message-ID: <CAD++jL=iqUPuVAmytT1kmMgV3cBxdvjMTAkg7PqaiafoRhguVQ@mail.gmail.com>
X-Gm-Features: AZwV_QimfTlckJYCT2zHhZcI3wnDbHT5acmPKReswmLekZo2WTj8N-fEd6bdc4w
Message-ID: <CAD++jL=iqUPuVAmytT1kmMgV3cBxdvjMTAkg7PqaiafoRhguVQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] pinctrl: core: managed resource handling cleanup
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Philipp Stanner <phasta@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, driver-core@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 11:33=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> I have stumbled over low-level APIs used for managed API implementations.
> Here is a clean up along with a drop of some duplicate messages.
>
> Andy Shevchenko (3):
>   pinctrl: core: Remove unused devm_pinctrl_unregister()
>   pinctrl: core: Simplify devm_pinctrl_*()
>   pinctrl: core: Remove duplicate error messages

Sweet, patches applied!

Yours,
Linus Walleij
