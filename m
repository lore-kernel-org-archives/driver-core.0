Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7DE1D6BB;
	Sun, 12 Jul 2026 14:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783865455; cv=none; b=XKBAhi712bK9Z3jsjiGH3sXlPYbYSQSll28wQzBfFfztTXfRgz/ig0jO3aRx8r9AxtDjYQfcajvqU1TkB40rKetuRZYuH5T1OcmEElFFyOK5IJ8zrTy5fwu+NyDnIeBTgfi/tP8Q3ZegTAv7kNl7f1M1ahvYRXdQf3lFLzu69Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783865455; c=relaxed/simple;
	bh=13soaVbxzmibHnMZRvkBKcepYgbvhu7c8U1JUAuAD1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwCc4XK4APdHbEAc4KAzL8SMpYrlkO0NkYZQTknJCRCe3tCl7/4mdI6MXn7uu6pjQnQFM27ESgpZZOtxScKgSeSHVdv3sjpqdTHi3hxDZId/CHNQsCxngllYzRJusRRxCOB7rXdZ4xPmRoJIQzLm4dp2xYNy3wV0cyV3sz0hN14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mqdD1vNi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mqdD1vNi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F741F000E9;
	Sun, 12 Jul 2026 14:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783865453;
	bh=Ns7n3IYGxvej29cNCIWuZmowXotbKxuLq29BdY+WhMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mqdD1vNiAKmD6krwNoUD9u+QnvNjibG5DI9z4+Sy2cceKzQnKQH+s7m3X0vxX9Z6A
	 2vYnxP+q6YNUsHXPX5D2TR8O9ieVyCu46pHUmzFHj5kJJK50cZsMYxWFFZmaHPaO6f
	 hMxUHSnyfgdiiZsrGwcwqMIzHXB1a1ZNzM8XqUy8=
Date: Sun, 12 Jul 2026 16:09:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: driver-core@lists.linux.dev, Danilo Krummrich <dakr@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Lyude Paul <lyude@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] driver core: faux: Move a variable assignment behind a
 condition check in faux_device_destroy()
Message-ID: <2026071217-fruit-uphill-eb0d@gregkh>
References: <1fe66c80-dfa5-4ef1-aec0-8f7fc3f2fe21@web.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1fe66c80-dfa5-4ef1-aec0-8f7fc3f2fe21@web.de>

On Sun, Jul 12, 2026 at 03:56:09PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 12 Jul 2026 15:45:19 +0200
> 
> The address of a data structure member was determined before
> a corresponding null pointer check in the implementation of
> the function “faux_device_destroy”.
> 
> Thus avoid the risk for undefined behaviour by moving the assignment
> for the variable “dev” behind a condition check.

There is no such "undefined behavior" here, sorry, please fix your
tools.
