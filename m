Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0DE42F715;
	Thu, 30 Jul 2026 14:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421486; cv=none; b=iaewUgAoRH1NGZPUB2v/90KrEc8+13YiMXgPXp7zFRCrmgDx+x0GSLLSeLufW/Gr1nqkeZWleC/0rsevuYVu/c1884SgxZcrL0llr9URXxGW5L92EEVn2fe1WBUMDmgLeq3VxZoW9y4Gt1KbMqurHFZq0mXQBvUb47Cwec4gtng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421486; c=relaxed/simple;
	bh=nS9tbncQ3VtrdZlvhHTNQi79TapyQCLKxJBNYSKVBUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LVy1sHSU+B1lGg8YZ2XFwyROWZF7IG5AF6jDiHYRV5lhdtjkksC6Nr/gBIW2Se/71t0hzbednm/lwX0cuVhRXhRpSUFCRD8ovh7oc/Sqn6CBLaYkwdhIpCRd+pOuIqPZ42uTtwi/rm0FhKQt7dCMA/vO4oQlqHvw8CJ5F7eB8P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1LJavwo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1LJavwo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0880A1F00A3E;
	Thu, 30 Jul 2026 14:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785421484;
	bh=rjo6Fn0l0tuqGSovn15VlBqh8iA6zzWy72sbNH2qSgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i1LJavwogg1gpW3IyZfyyZWTemZQbGTm/kyGs7qJVQ0FpYGbJDZ9m4y3EDUxwyfqA
	 wMMcwwPFhl0a3Gt1jXoI71EpnLR9RGgFsB+Rj6H2NNHT6mF8EEkkzxGmVv+EqTS2C+
	 6R4RhghNaF6mzBFbEUu61a9f4JDh+mJjeS7w1o4B4NOKC7f6ODJkkzEH1aMnGCgSE8
	 floZ8pUnpRzi8Cvr/vSq9stnQCgsR/Ey6oEeRALwEJWxMoIASN1TpjX/8KKVxEQj5k
	 n83UyH78KGCkTuqvNOtn4lBRNgS0B3eorQHnLWbb8R6w7sDsbDtRpS55hbo+9ggGfc
	 a/LTArbpzrT+Q==
From: Danilo Krummrich <dakr@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/driver-api: infrastructure: add property.h and fwnode.h
Date: Thu, 30 Jul 2026 16:24:40 +0200
Message-ID: <20260730142440.588787-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726211200.2643484-1-rdunlap@infradead.org>
References: <20260726211200.2643484-1-rdunlap@infradead.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 26 Jul 2026 14:12:00 -0700, Randy Dunlap wrote:
> [PATCH] docs/driver-api: infrastructure: add property.h and fwnode.h

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] docs/driver-api: infrastructure: add property.h and fwnode.h
      commit: f6e6e96d16b8

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
